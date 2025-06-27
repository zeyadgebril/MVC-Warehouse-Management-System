INSERT INTO [Category] (Name, Description, ParentCategoryID) VALUES
('Electronics', 'Devices and gadgets', NULL),
('Laptops', 'Portable computers', 1),
('Smartphones', 'Mobile phones', 1),
('Accessories', 'Computer accessories', 1),
('Furniture', 'Home and office furniture', NULL),
('Chairs', 'Seating furniture', 5),
('Tables', 'Table furniture', 5),
('Kitchen', 'Kitchen items', NULL),
('Decor', 'Decorative items', NULL),
('Outdoor', 'Outdoor equipment', NULL);
go

INSERT INTO [Product] (Name, Description, AvailableStock, Barcode, CategoryId, CurrentQuantity, MinAvailableStock, UnitPrice, CostPrice, Weight, ImageURL, IsActive) VALUES
('Laptop A', 'High-end laptop', 50, 'BARCODE001', 2, 50, 5, 1200.00, 900.00, 2.50, 'image1.jpg', 1),
('Laptop B', 'Budget laptop', 30, 'BARCODE002', 2, 30, 5, 700.00, 500.00, 2.20, 'image2.jpg', 1),
('Smartphone X', 'Flagship phone', 80, 'BARCODE003', 3, 80, 10, 999.99, 750.00, 0.30, 'image3.jpg', 1),
('Smartphone Y', 'Mid-range phone', 100, 'BARCODE004', 3, 100, 10, 599.99, 400.00, 0.28, 'image4.jpg', 1),
('Mouse', 'Wireless mouse', 150, 'BARCODE005', 4, 150, 20, 19.99, 10.00, 0.10, 'image5.jpg', 1),
('Office Chair', 'Ergonomic chair', 40, 'BARCODE006', 6, 40, 5, 150.00, 100.00, 12.00, 'image6.jpg', 1),
('Dining Table', 'Wooden table', 20, 'BARCODE007', 7, 20, 2, 300.00, 200.00, 30.00, 'image7.jpg', 1),
('Blender', 'Kitchen blender', 60, 'BARCODE008', 8, 60, 10, 49.99, 30.00, 3.00, 'image8.jpg', 1),
('Vase', 'Ceramic vase', 80, 'BARCODE009', 9, 80, 10, 24.99, 15.00, 1.20, 'image9.jpg', 1),
('Tent', 'Camping tent', 25, 'BARCODE010', 10, 25, 5, 120.00, 80.00, 8.00, 'image10.jpg', 1);
go


INSERT INTO [Supplier] (Name, Company, Email, Phone, Address, PaymentTerm, IsActive, Notes, isDeleted) VALUES
('Supplier One', 'Company A', 'sup1@example.com', '111-1111', 'Address A', 'Net 30', 1, 'Top rated', 0),
('Supplier Two', 'Company B', 'sup2@example.com', '222-2222', 'Address B', 'Net 15', 1, 'Fast delivery', 0),
('Supplier Three', 'Company C', 'sup3@example.com', '333-3333', 'Address C', 'COD', 1, '', 0),
('Supplier Four', 'Company D', 'sup4@example.com', '444-4444', 'Address D', 'Net 45', 1, 'Reliable', 0),
('Supplier Five', 'Company E', 'sup5@example.com', '555-5555', 'Address E', 'Prepaid', 1, '', 0),
('Supplier Six', 'Company F', 'sup6@example.com', '666-6666', 'Address F', 'Net 30', 1, '', 0),
('Supplier Seven', 'Company G', 'sup7@example.com', '777-7777', 'Address G', 'Net 60', 1, '', 0),
('Supplier Eight', 'Company H', 'sup8@example.com', '888-8888', 'Address H', 'COD', 1, '', 0),
('Supplier Nine', 'Company I', 'sup9@example.com', '999-9999', 'Address I', 'Net 15', 1, '', 0),
('Supplier Ten', 'Company J', 'sup10@example.com', '000-0000', 'Address J', 'Net 30', 1, '', 0);
go


INSERT INTO [Supplier_Product] (ProductId, SupplierID, SupplierSKU, LeadTimeDays, UnitCost, isDeleted) VALUES
(1, 1, 'SKU001', 5, 880.00, 0),
(2, 2, 'SKU002', 7, 480.00, 0),
(3, 3, 'SKU003', 4, 720.00, 0),
(4, 4, 'SKU004', 6, 380.00, 0),
(5, 5, 'SKU005', 3, 9.00, 0),
(6, 6, 'SKU006', 10, 95.00, 0),
(7, 7, 'SKU007', 12, 190.00, 0),
(8, 8, 'SKU008', 5, 28.00, 0),
(9, 9, 'SKU009', 2, 13.00, 0),
(10, 10, 'SKU010', 8, 75.00, 0);
go




INSERT INTO [Warehouse] (Name, Location, ContactPhone, Capacity, IsActive, isDeleted) VALUES
('Main Warehouse', '123 Main St', '111-2222', 10000, 1, 0),
('Secondary Warehouse', '456 Elm St', '222-3333', 8000, 1, 0),
('Downtown Storage', '789 Oak St', '333-4444', 5000, 1, 0),
('East Side Depot', '101 Pine St', '444-5555', 7000, 1, 0),
('West Side Hub', '202 Maple St', '555-6666', 6000, 1, 0),
('North Warehouse', '303 Birch St', '666-7777', 4000, 1, 0),
('South Warehouse', '404 Cedar St', '777-8888', 4500, 1, 0),
('Central Storage', '505 Walnut St', '888-9999', 5500, 1, 0),
('Express Depot', '606 Ash St', '999-0000', 3000, 1, 0),
('Overflow Hub', '707 Cherry St', '000-1111', 2000, 1, 0);
go


INSERT INTO [InventoryLocation] (WarehouseID, LocationCode, Description, IsActive, isDeleted) VALUES
(1, 'LOC1', 'Main bay', 1, 0),
(2, 'LOC2', 'Secondary rack', 1, 0),
(3, 'LOC3', 'Downtown zone', 1, 0),
(4, 'LOC4', 'East section', 1, 0),
(5, 'LOC5', 'West shelf', 1, 0),
(6, 'LOC6', 'North area', 1, 0),
(7, 'LOC7', 'South corner', 1, 0),
(8, 'LOC8', 'Central aisle', 1, 0),
(9, 'LOC9', 'Express rack', 1, 0),
(10, 'LOC10', 'Overflow bay', 1, 0);
go




INSERT INTO [InventoryRecord] (ProductId, LocationId, QuantityOnHand, isDeleted) VALUES
(1, 1, 40, 0),
(2, 2, 25, 0),
(3, 3, 60, 0),
(4, 4, 75, 0),
(5, 5, 100, 0),
(6, 6, 30, 0),
(7, 7, 15, 0),
(8, 8, 50, 0),
(9, 9, 65, 0),
(10, 10, 20, 0);
go


INSERT INTO [ProductHistory] (ProductID, Status, PreviousQuantity, NewQuantity, Reason, ReferenceID, UserID, isDeleted) VALUES
(1, 'SALE', 50, 45, 'Customer order', 1, 'user1', 0),
(2, 'RETURN', 25, 27, 'Customer return', 2, 'user2', 0),
(3, 'ADJUSTMENT', 60, 62, 'Stock count correction', 3, 'user3', 0),
(4, 'DAMAGED', 75, 70, 'Damaged item', 4, 'user4', 0),
(5, 'EXPIRED', 100, 95, 'Expired stock', 5, 'user5', 0),
(6, 'SALE', 30, 28, 'Online order', 6, 'user6', 0),
(7, 'RETURN', 15, 16, 'Customer return', 7, 'user7', 0),
(8, 'ADJUSTMENT', 50, 52, 'Inventory audit', 8, 'user8', 0),
(9, 'DAMAGED', 65, 63, 'Warehouse damage', 9, 'user9', 0),
(10, 'SALE', 20, 19, 'Store sale', 10, 'user10', 0);
go





INSERT INTO [InventoryTransaction] (ProductID, Quantity, TransactionType, FromLocationID, ToLocationID, UserID, Notes, isDeleted) VALUES
(1, 5, 'SALE', 1, NULL, 'user1', 'Sold to customer', 0),
(2, 2, 'RETURN', NULL, 2, 'user2', 'Customer return', 0),
(3, 10, 'PURCHASE', NULL, 3, 'user3', 'Supplier delivery', 0),
(4, 3, 'ADJUSTMENT', 4, NULL, 'user4', 'Inventory correction', 0),
(5, 7, 'TRANSFER', 5, 6, 'user5', 'Moved stock', 0),
(6, 4, 'SALE', 6, NULL, 'user6', 'POS sale', 0),
(7, 1, 'RETURN', NULL, 7, 'user7', 'Customer return', 0),
(8, 8, 'PURCHASE', NULL, 8, 'user8', 'Bulk supplier order', 0),
(9, 2, 'ADJUSTMENT', 9, NULL, 'user9', 'Stock check', 0),
(10, 3, 'TRANSFER', 10, 1, 'user10', 'Rebalancing stock', 0);
go


INSERT INTO [Return] (OriginalTransactionID, ProductID, Quantity, Reason, Condition, ProcessedBy, Notes, isDeleted) VALUES
(2, 2, 2, 'CUSTOMER_RETURN', 'NEW', 'user2', 'Customer changed mind', 0),
(7, 7, 1, 'DAMAGED', 'DAMAGED', 'user7', 'Returned damaged', 0),
(2, 2, 1, 'WRONG_ITEM', 'NEW', 'user2', 'Wrong item sent', 0),
(7, 7, 1, 'EXPIRED', 'EXPIRED', 'user7', 'Expired product', 0),
(2, 2, 1, 'CUSTOMER_RETURN', 'USED', 'user2', 'Used but returned', 0),
(7, 7, 1, 'DAMAGED', 'DAMAGED', 'user7', 'Broken on delivery', 0),
(2, 2, 1, 'WRONG_ITEM', 'NEW', 'user2', 'Incorrect SKU', 0),
(7, 7, 1, 'EXPIRED', 'EXPIRED', 'user7', 'Old stock', 0),
(2, 2, 1, 'CUSTOMER_RETURN', 'USED', 'user2', 'Opened and returned', 0),
(7, 7, 1, 'DAMAGED', 'DAMAGED', 'user7', 'Damage in warehouse', 0);
go