-- Create tables in proper order to satisfy foreign key dependencies

CREATE TABLE [Category] (
  [CategoryID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50),
  [Description] text,
  [ParentCategoryID] int,
  [isDeleted] bit DEFAULT 0
)
GO

CREATE TABLE [Product] (
  [ProductId] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(100),
  [Description] text,
  [AvailableStock] int,
  [Barcode] varchar(50),
  [CategoryId] int,
  [CurrentQuantity] int,
  [MinAvailableStock] int,
  [UnitPrice] decimal(10,2),
  [CostPrice] decimal(10,2),
  [Weight] decimal(10,2),
  [ImageURL] varchar(255),
  [IsActive] bit,
  [CreatedDate] datetime DEFAULT (GETDATE()),
  [LastUpdated] datetime DEFAULT (GETDATE()),
  [IsDeleted] bit DEFAULT 0
)
GO

CREATE TABLE [Supplier] (
  [SupplierID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(100),
  [Company] varchar(100),
  [Email] varchar(100),
  [Phone] varchar(20),
  [Address] text,
  [PaymentTerm] varchar(50),
  [IsActive] bit,
  [Notes] text,
  [isDeleted] bit
)
GO

CREATE TABLE [Supplier_Product] (
  [ProductId] int NOT NULL,
  [SupplierID] int NOT NULL,
  [SupplierSKU] varchar(50),
  [LeadTimeDays] int DEFAULT (0),
  [UnitCost] decimal(10,2),
  [isDeleted] bit,
  PRIMARY KEY ([ProductId], [SupplierID])
)
GO

CREATE TABLE [User] (
  [UserID] nvarchar(128) PRIMARY KEY, -- Reduced from 255 to avoid key length warning
  [UserName] varchar(50),
  [PasswordHash] varchar(255),
  [FullName] varchar(100),
  [Email] varchar(100),
  [IsActive] bit,
  [LastLogin] datetime,
  [CreatedDate] datetime DEFAULT (GETDATE()),
  [isDeleted] bit
)
GO

CREATE TABLE [Warehouse] (
  [WarehouseID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(100),
  [Location] text,
  [ContactPhone] varchar(20),
  [Capacity] int,
  [IsActive] bit,
  [isDeleted] bit
)
GO

CREATE TABLE [InventoryLocation] (
  [LocationID] int PRIMARY KEY IDENTITY(1, 1),
  [WarehouseID] int,
  [LocationCode] varchar(20),
  [Description] text,
  [IsActive] bit,
  [isDeleted] bit
)
GO

CREATE TABLE [ProductHistory] (
  [HistoryID] int PRIMARY KEY IDENTITY(1, 1),
  [ProductID] int,
  [Status] varchar(20),
  [PreviousQuantity] int,
  [NewQuantity] int,
  [Reason] varchar(100),
  [ReferenceID] int,
  [TimeStamp] datetime DEFAULT (GETDATE()),
  [UserID] nvarchar(128),
  [isDeleted] bit
)
GO

CREATE TABLE [UserLog] (
  [LogID] int PRIMARY KEY IDENTITY(1, 1),
  [UserID] nvarchar(128),
  [ActionType] varchar(20),
  [TimeStamp] datetime DEFAULT (GETDATE()),
  [AdditionalInfo] text
)
GO

CREATE TABLE [InventoryTransaction] (
  [TransactionID] int PRIMARY KEY IDENTITY(1, 1),
  [ProductID] int,
  [Quantity] int,
  [TransactionType] varchar(20),
  [FromLocationID] int,
  [ToLocationID] int,
  [TimeStamp] datetime DEFAULT (GETDATE()),
  [UserID] nvarchar(128),
  [Notes] text,
  [isDeleted] bit
)
GO

CREATE TABLE [Return] (
  [ReturnID] int PRIMARY KEY IDENTITY(1, 1),
  [OriginalTransactionID] int,
  [ProductID] int,
  [Quantity] int,
  [Reason] varchar(20),
  [Condition] varchar(20),
  [ReturnDate] datetime DEFAULT (GETDATE()),
  [ProcessedBy] nvarchar(128),
  [Notes] text,
  [isDeleted] bit
)
GO

CREATE TABLE [InventoryRecord] (
  [ProductId] int NOT NULL,
  [LocationId] int NOT NULL,
  [QuantityOnHand] int,
  [LastUpdated] datetime DEFAULT (GETDATE()),
  [isDeleted] bit,
  PRIMARY KEY ([ProductId], [LocationId])
)
GO

CREATE TABLE [Role] (
  [RoleID] nvarchar(128) PRIMARY KEY, -- Reduced from 255 to avoid key length warning
  [Name] varchar(50),
  [Description] text
)
GO

CREATE TABLE [UserRole] (
  [UserID] nvarchar(128) NOT NULL,
  [RoleID] nvarchar(128) NOT NULL,
  [AssignedDate] datetime DEFAULT (GETDATE()),
  PRIMARY KEY ([UserID], [RoleID])
)
GO

-- Add check constraints for enum-like columns
ALTER TABLE [ProductHistory] ADD CONSTRAINT [CK_ProductHistory_Status] 
CHECK ([Status] IN ('SALE', 'RETURN', 'DAMAGED', 'EXPIRED', 'ADJUSTMENT'))
GO

ALTER TABLE [UserLog] ADD CONSTRAINT [CK_UserLog_ActionType] 
CHECK ([ActionType] IN ('LOGIN', 'LOGOUT', 'PASSWORD_CHANGE', 'PROFILE_UPDATE'))
GO

ALTER TABLE [InventoryTransaction] ADD CONSTRAINT [CK_InventoryTransaction_TransactionType] 
CHECK ([TransactionType] IN ('PURCHASE', 'SALE', 'RETURN', 'ADJUSTMENT', 'TRANSFER'))
GO

ALTER TABLE [Return] ADD CONSTRAINT [CK_Return_Reason] 
CHECK ([Reason] IN ('DAMAGED', 'EXPIRED', 'CUSTOMER_RETURN', 'WRONG_ITEM'))
GO

ALTER TABLE [Return] ADD CONSTRAINT [CK_Return_Condition] 
CHECK ([Condition] IN ('NEW', 'DAMAGED', 'EXPIRED', 'USED'))
GO

-- Add foreign key constraints
ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Category] 
FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([CategoryID])
GO

ALTER TABLE [Category] ADD CONSTRAINT [FK_Category_ParentCategory] 
FOREIGN KEY ([ParentCategoryID]) REFERENCES [Category] ([CategoryID])
GO

ALTER TABLE [Supplier_Product] ADD CONSTRAINT [FK_Supplier_Product_Product] 
FOREIGN KEY ([ProductId]) REFERENCES [Product] ([ProductId])
GO

ALTER TABLE [Supplier_Product] ADD CONSTRAINT [FK_Supplier_Product_Supplier] 
FOREIGN KEY ([SupplierID]) REFERENCES [Supplier] ([SupplierID])
GO

ALTER TABLE [ProductHistory] ADD CONSTRAINT [FK_ProductHistory_Product] 
FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ProductId])
GO

ALTER TABLE [ProductHistory] ADD CONSTRAINT [FK_ProductHistory_User] 
FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [InventoryLocation] ADD CONSTRAINT [FK_InventoryLocation_Warehouse] 
FOREIGN KEY ([WarehouseID]) REFERENCES [Warehouse] ([WarehouseID])
GO

ALTER TABLE [UserLog] ADD CONSTRAINT [FK_UserLog_User] 
FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [InventoryTransaction] ADD CONSTRAINT [FK_InventoryTransaction_Product] 
FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ProductId])
GO

ALTER TABLE [InventoryTransaction] ADD CONSTRAINT [FK_InventoryTransaction_FromLocation] 
FOREIGN KEY ([FromLocationID]) REFERENCES [InventoryLocation] ([LocationID])
GO

ALTER TABLE [InventoryTransaction] ADD CONSTRAINT [FK_InventoryTransaction_ToLocation] 
FOREIGN KEY ([ToLocationID]) REFERENCES [InventoryLocation] ([LocationID])
GO

ALTER TABLE [InventoryTransaction] ADD CONSTRAINT [FK_InventoryTransaction_User] 
FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Return] ADD CONSTRAINT [FK_Return_InventoryTransaction] 
FOREIGN KEY ([OriginalTransactionID]) REFERENCES [InventoryTransaction] ([TransactionID])
GO

ALTER TABLE [Return] ADD CONSTRAINT [FK_Return_Product] 
FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ProductId])
GO

ALTER TABLE [Return] ADD CONSTRAINT [FK_Return_User] 
FOREIGN KEY ([ProcessedBy]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [InventoryRecord] ADD CONSTRAINT [FK_InventoryRecord_Product] 
FOREIGN KEY ([ProductId]) REFERENCES [Product] ([ProductId])
GO

ALTER TABLE [InventoryRecord] ADD CONSTRAINT [FK_InventoryRecord_Location] 
FOREIGN KEY ([LocationId]) REFERENCES [InventoryLocation] ([LocationID])
GO

ALTER TABLE [UserRole] ADD CONSTRAINT [FK_UserRole_User] 
FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [UserRole] ADD CONSTRAINT [FK_UserRole_Role] 
FOREIGN KEY ([RoleID]) REFERENCES [Role] ([RoleID])
GO