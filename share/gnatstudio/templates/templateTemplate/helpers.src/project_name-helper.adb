with Ada.Text_IO; use Ada.Text_IO;
with Project_Name.Version;
with Ada.Command_Line;
procedure Project_Name.Helper is
   pragma Warnings (Off);
   package GPR is
      VERSION : constant String := $VERSION;
      DATE    : constant String := $DATE;
   end GPR;
   Fail : Boolean := False;
   package README is
      function VERSION return String;
      function DATE return String;
   end  README;

   package body README is
      function VERSION return String is ("TBD");
      function DATE return String is ("TBD");
   end  README;

begin
   if GPR.VERSION /= Project_Name.Version.VERSION then
      Fail := True;
      Put_Line ("GPR.VERSION    /= Project_Name.Version.VERSION: """ & GPR.VERSION & """ /= """ &  Project_Name.Version.VERSION & """");
   end if;

   if GPR.DATE /= Project_Name.Version.DATE then
      Fail := True;
      Put_Line ("GPR.DATE       /= Project_Name.Version.DATE   : """ & GPR.DATE & """ /= """ & Project_Name.Version.DATE & """");
   end if;

   if README.VERSION /= Project_Name.Version.VERSION then
      Fail := True;
      Put_Line ("README.VERSION /= Project_Name.Version.VERSION: """ & README.VERSION & """ /= """ &  Project_Name.Version.VERSION & """");
   end if;

   if README.DATE /= Project_Name.Version.DATE then
      Fail := True;
      Put_Line ("README.DATE    /= Project_Name.Version.DATE   : """ & README.DATE & """ /= """ & Project_Name.Version.DATE & """");
   end if;

   if Fail then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
end;
