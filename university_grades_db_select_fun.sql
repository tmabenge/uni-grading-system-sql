CREATE FUNCTION GetLetterGrade(@percentage DECIMAL(5,2))
RETURNS VARCHAR(2)
AS
BEGIN
    DECLARE @letterGrade VARCHAR(2);

    SET @letterGrade =
        CASE
            WHEN @percentage >= 90 THEN 'A'
            WHEN @percentage >= 80 THEN 'B'
            WHEN @percentage >= 70 THEN 'C'
            WHEN @percentage >= 60 THEN 'D'
            ELSE 'F'
        END;

    RETURN @letterGrade;
END;

GO

CREATE FUNCTION GetFullName(@userId INT)
RETURNS VARCHAR(101)
AS
BEGIN
    DECLARE @fullName VARCHAR(101);

    SELECT @fullName = first_name + ' ' + last_name
    FROM users
    WHERE id = @userId;

    RETURN @fullName;
END;