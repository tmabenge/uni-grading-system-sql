CREATE TRIGGER UpdateUserUpdatedAt
ON users
AFTER UPDATE
AS
BEGIN
    UPDATE users
    SET updated_at = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM inserted);
END;

GO

CREATE TRIGGER LogCourseDeletion
ON courses
AFTER DELETE
AS
BEGIN
    INSERT INTO course_deletion_log (course_id, course_code)
    SELECT id, course_code
    FROM deleted; 
END;

GO

CREATE TRIGGER ValidateGrade
ON grades
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i JOIN assignments a ON i.assignment_id = a.id WHERE i.points_earned > a.max_points)
    BEGIN
        RAISERROR('Points earned cannot exceed maximum points.', 16, 1);
        ROLLBACK TRANSACTION; 
    END;
END;
GO