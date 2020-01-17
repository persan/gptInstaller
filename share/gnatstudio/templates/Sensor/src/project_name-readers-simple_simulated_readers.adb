pragma Ada_2012;
package body Project_Name.Readers.Simple_Simulated_Readers is

   ----------
   -- Open --
   ----------

   procedure Open (Source : in out Simple_Simulated_Reader) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Open unimplemented");
      raise Program_Error with "Unimplemented procedure Open";
   end Open;

   -----------
   -- Close --
   -----------

   procedure Close (Source : in out Simple_Simulated_Reader) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Close unimplemented");
      raise Program_Error with "Unimplemented procedure Close";
   end Close;

   ----------
   -- Read --
   ----------

   overriding function Read
     (Source : Simple_Simulated_Reader)
      return Project_Name.Messages.Project_Name_Message'Class
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Read unimplemented");
      return raise Program_Error with "Unimplemented function Read";
   end Read;

end Project_Name.Readers.Simple_Simulated_Readers;
