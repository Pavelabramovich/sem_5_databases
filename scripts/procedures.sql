CREATE OR REPLACE PROCEDURE add_book_to_order(_order_id INTEGER, _book_id INTEGER, _count INTEGER DEFAULT 1) 
AS $$
BEGIN
	IF (EXISTS(SELECT * FROM orders_books AS ob 
			   WHERE ob.order_id = _order_id AND ob.book_id = _book_id)) THEN
    	UPDATE orders_books SET "count" = "count" + _count WHERE "order_id" = _order_id AND "book_id" = _book_id;
	ELSE
		INSERT INTO orders_books (order_id, book_id, count) 
		VALUES (_order_id, _book_id, _count);
	END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE add_book_to_cart(_cart_id INTEGER, _book_id INTEGER, _count INTEGER DEFAULT 1) 
AS $$
BEGIN
	IF (EXISTS(SELECT * FROM carts_books AS cb 
			   WHERE cb.cart_id = _cart_id AND cb.book_id = _book_id)) THEN
    	UPDATE carts_books SET "count" = "count" + _count WHERE "cart_id" = _cart_id AND "book_id" = _book_id;
	ELSE
		INSERT INTO carts_books (cart_id, book_id, count) 
		VALUES (_cart_id, _book_id, _count);
	END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE add_provider_to_book(_book_id INTEGER, _provider_id INTEGER) 
AS $$
BEGIN
	IF NOT (EXISTS(SELECT * FROM providers_books AS pb 
			   WHERE pb.provider_id = _provider_id AND pb.book_id = _book_id)) THEN
    	INSERT INTO providers_books (provider_id, book_id) 
		VALUES (_provider_id, _book_id);
	END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE add_order(_user_id INTEGER)
AS $$
DECLARE
	order_time TIMESTAMP := NOW();
	order_book_id INTEGER;
BEGIN
	INSERT INTO orders (user_id, time)
    VALUES (_user_id, order_time)
    RETURNING id INTO order_book_id;
END;
$$ LANGUAGE plpgsql;
