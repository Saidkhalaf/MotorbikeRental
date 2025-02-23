CREATE OR REPLACE PACKAGE PKG_S2_MOTORBIKES AS

    PROCEDURE BEWIJS_M4_S2;
    PROCEDURE EMPTY_TABLES_S2;

    PROCEDURE BEWIJS_MILESTONE_M5_S2(
        p_motorbike_count IN NUMBER DEFAULT 1,
        p_department_count in number default 1,
        p_maintenance_count in number default 1,
        p_employee_count in number default 1,
        p_service_count in number default 1);

    PROCEDURE Bewijs_Milestone_M7_S2(
        p_department_count in number default 1,
        p_motorbike_count in number default 1,
        p_maintenance_count in number default 1,
        p_employee_count in number default 1,
        p_service_count in number default 1
);

End PKG_S2_MOTORBIKES;















