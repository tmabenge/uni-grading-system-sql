CREATE PROCEDURE CalculateFinalGrade
    @studentId INT,
    @courseId INT
AS
BEGIN
    DECLARE @totalPointsEarned INT, @totalMaxPoints INT;

    SELECT @totalPointsEarned = SUM(g.points_earned), @totalMaxPoints = SUM(a.max_points)
    FROM grades g
    JOIN assignments a ON g.assignment_id = a.id
    WHERE g.student_id = @studentId AND a.course_id = @courseId;

    SELECT @totalPointsEarned * 100.0 / @totalMaxPoints AS final_grade;
END;

GO

CREATE PROCEDURE UnenrollStudent
    @studentId INT,
    @courseId INT
AS
BEGIN
    DELETE FROM enrollments
    WHERE student_id = @studentId AND course_id = @courseId;
END;