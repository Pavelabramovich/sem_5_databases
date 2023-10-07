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
    AuthorId     INTEGER          REFERENCES Authors (Id) ON DELETE CASCADE
);


CREATE TABLE Authors (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Name         VARCHAR (64)     NOT NULL UNIQUE
);


CREATE TABLE Orders (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    UserId       INTEGER          REFERENCES Users (Id) ON DELETE SET NULL
);


CREATE TABLE Reviews (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,        
    Text         VARCHAR (1024)   NOT NULL,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE,
    UserId       INTEGER          REFERENCES Users (Id) ON DELETE CASCADE
);


CREATE TABLE ProvidersBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    ProviderId   INTEGER          REFERENCES Providers (UserPtr) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE,

    UNIQUE (ProviderId, BookId)
);


CREATE TABLE OrdersBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    OrderId      INTEGER          REFERENCES Orders (Id) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE,
    Count        INTEGER          NOT NULL DEFAULT 1,

    UNIQUE (OrderId, BookId)
);


CREATE TABLE BooksCategories (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,    
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE,
    CategoryId   INTEGER          REFERENCES Categories (Id) ON DELETE CASCADE,

    UNIQUE (CategoryId, BookId)
);



CREATE TABLE CartsBooks (
    Id           INTEGER          PRIMARY KEY AUTOINCREMENT,      
    CartId       INTEGER          REFERENCES Carts (Id) ON DELETE CASCADE,
    BookId       INTEGER          REFERENCES Books (Id) ON DELETE CASCADE,
    Count        INTEGER          NOT NULL DEFAULT 1,

    UNIQUE (CartId, BookId)
);

