# Subject Change Request Problem

This repository contains a solution for managing subject change requests for a college using SQL Server.

## Problem Statement

A college needs to develop a system that tracks the Open Elective Subjects of their students. The system should maintain a history of subject changes for each student, showing both current and previous choices.

## Solution

### Database Tables

Two main tables are used:
- **SubjectAllotments**: Stores current and historical subject allotments for students.
- **SubjectRequest**: Records requests for subject changes.

### Stored Procedure

A stored procedure `UpdateSubjectAllotments` is implemented to:
- Check and update subject allotments based on change requests.
- Ensure visibility of both current and previous subject choices for students.

### Example Usage

Sample SQL scripts demonstrate:
- Creation of database tables (`SubjectAllotments`, `SubjectRequest`).
- Insertion of sample data.
- Execution of the `UpdateSubjectAllotments` stored procedure to process a subject change request.

## Contact

If you have any questions or suggestions, feel free to reach out to me at:
- **Name**: [Rakshit Gupta](https://github.com/Rakshitgupta9/Celebal-Internship)
- **ID**: CT_CSI_SQ_4156
- **Email**: guptarakshit9858@gmail.com
- **LinkedIn**: [Rakshit Gupta](https://www.linkedin.com/in/rakshit9/)
