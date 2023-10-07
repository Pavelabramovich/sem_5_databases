CREATE TABLE Users (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,
    Login        VARCHAR (64)     NOT NULL UNIQUE,
    Password     VARCHAR (64)     NOT NULL,	
    Name         VARCHAR (64)     NOT NULL UNIQUE,
    RoleId       INTEGER          REFERENCES Roles (Id) ON DELETE SET NULL,
    CouponId     INTEGER          REFERENCES Coupons (Id) ON DELETE SET NULL
);


CREATE TABLE Roles (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Name         VARCHAR (64)     NOT NULL UNIQUE
);


CREATE TABLE Carts (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    UserId       INTEGER          NOT NULL UNIQUE REFERENCES Users (Id) ON DELETE CASCADE
);


CREATE TABLE Providers (
    UserPtr      INTEGER          PRIMARY KEY REFERENCES Users (Id) ON DELETE CASCADE
);


CREATE TABLE Coupons (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Discount     REAL             NOT NULL UNIQUE
);


CREATE TABLE Categories (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Name         VARCHAR (64)     NOT NULL UNIQUE
);


CREATE TABLE Books (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,   
    Title        VARCHAR (64)     NOT NULL,
    AuthorId     INTEGER          REFERENCES Authors (Id) ON DELETE CASCADE,
    CategoryId   INTEGER          REFERENCES Categories (Id) ON DELETE SET NULL
);


CREATE TABLE Authors (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Name         VARCHAR (64)     NOT NULL UNIQUE
);


CREATE TABLE Orders (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    COUNT        INTEGER          NOT NULL,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE SET NULL,
    UserId       INTEGER          REFERENCES Users (Id) ON DELETE SET NULL
);


CREATE TABLE Reviews (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Title        VARCHAR (64)     NOT NULL,
    Text         VARCHAR (1024)   NOT NULL,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE,
    UserId       INTEGER          REFERENCES Users (Id) ON DELETE CASCADE
);


CREATE TABLE ProvidersBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    ProviderId   INTEGER          REFERENCES Providers (Id) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE
);


CREATE TABLE OrdersBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    OrderId      INTEGER          REFERENCES Orders (Id) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE
);


CREATE TABLE CategoriesBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    CategoryId   INTEGER          REFERENCES Categories (Id) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE
);



CREATE TABLE CartBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    CartId       INTEGER          REFERENCES Carts (Id) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE
);

