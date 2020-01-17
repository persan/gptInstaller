pragma Ada_2012;
package body Project_Name.Readers.Serial_Port_Readers is

   ----------
   -- Open --
   ----------

   procedure Open
     (Port      : Serial_Port_Reader; Path : Port_Name;
      Rate      : Data_Rate := B9600;
      Bits      : Data_Bits := CS8;
      Stop_Bits : Stop_Bits_Number := One;
      Parity    : Parity_Check := None;
      Block     : Boolean := True; Local : Boolean := True;
      Flow      : Flow_Control := None;
      Timeout   : Duration := 10.0)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Open unimplemented");
      raise Program_Error with "Unimplemented procedure Open";
   end Open;

   -----------
   -- Close --
   -----------

   overriding procedure Close (Source : in out Serial_Port_Reader) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Close unimplemented");
      raise Program_Error with "Unimplemented procedure Close";
   end Close;

   ----------
   -- Read --
   ----------

   overriding function Read
     (Source : Serial_Port_Reader)
      return Project_Name.Messages.Project_Name_Message'Class
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Read unimplemented");
      return raise Program_Error with "Unimplemented function Read";
   end Read;

end Project_Name.Readers.Serial_Port_Readers;
