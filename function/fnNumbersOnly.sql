CREATE FUNCTION [dbo].[fnNumbersOnly](@p_OriginalString NVARCHAR(MAX))
-- ALTER FUNCTION [dbo].[fnNumbersOnly](@p_OriginalString NVARCHAR(MAX))
RETURNS NVARCHAR(MAX) AS
BEGIN

  DECLARE @i INT = 1; -- must start from 1, as SubString is 1-based
  DECLARE @OriginalString NVARCHAR(MAX) = @p_OriginalString
  DECLARE @ModifiedString NVARCHAR(MAX) = '';

  WHILE @i <= Len(@OriginalString)
    BEGIN
      IF SubString(@OriginalString, @i, 1) LIKE '[0-9]'
        BEGIN
          SET @ModifiedString = @ModifiedString + SubString(@OriginalString, @i, 1);
        END
      SET @i = @i + 1;
    END

  RETURN @ModifiedString

END
