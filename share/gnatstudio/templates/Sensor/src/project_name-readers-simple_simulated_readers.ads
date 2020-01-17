package Project_Name.Readers.Simple_Simulated_Readers is

   type Simple_Simulated_Reader is new Project_Name.Readers.Reader with record
      null;
   end record;

   procedure Open (Source  : in out Simple_Simulated_Reader);

   procedure Close (Source : in out Simple_Simulated_Reader);

   overriding
   function Read (Source : Simple_Simulated_Reader) return Project_Name.Messages.Project_Name_Message'Class;

end Project_Name.Readers.Simple_Simulated_Readers;
