SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[ReportPublicList] AS
        
    SELECT
        report_id,
        replace(title, ',', '') AS title,
        report_description,
        public_flag
    FROM
        dbo.report
    WHERE
        public_flag = 1
            
GO