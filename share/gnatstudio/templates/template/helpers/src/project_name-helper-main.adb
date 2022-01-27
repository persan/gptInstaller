with GNAT.Calendar.Time_IO;
with Ada.Calendar;

procedure Project_Name.Helper.Main is
   use GNAT.Calendar.Time_IO;
   use Ada.Calendar;
begin

   if GPR.VERSION /= Project_Name.Version.VERSION then
      Fail := True;
      Put_Line ("GPR.VERSION    /= Project_Name.Version.VERSION: """ & GPR.VERSION & """ /= """ &  Project_Name.Version.VERSION & """");
   end if;

   if GPR.DATE /= Project_Name.Version.DATE then
      Fail := True;
      Put_Line ("GPR.DATE       /= Project_Name.Version.DATE   : """ & GPR.DATE & """ /= """ & Project_Name.Version.DATE & """");
   end if;

   if README.Initialize then

      if README.VERSION /= Project_Name.Version.VERSION then
         Fail := True;
         Put_Line ("README.VERSION /= Project_Name.Version.VERSION: """ & README.VERSION & """ /= """ &  Project_Name.Version.VERSION & """");
      end if;

      if README.DATE /= Project_Name.Version.DATE then
         Fail := True;
         Put_Line ("README.DATE    /= Project_Name.Version.DATE   : """ & README.DATE & """ /= """ & Project_Name.Version.DATE & """");
      end if;
   else
      Fail := True;
   end if;
   if Strict_Date then
      if README.DATE /= Image (Clock, ISO_Date) then
         Put_Line ("README.DATE  /= Ada.Calendar.Clock : " & """" & README.DATE & """ /= " &
                     """" & Image (Clock, ISO_Date) & """");
      end if;
   end if;

   if Fail then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
end;
