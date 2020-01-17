with Project_Name.Messages;
package Project_Name.Readers is
   type Reader is limited interface;
   function Read (Source : Reader) return Project_Name.Messages.Project_Name_Message'Class is abstract;
   -- procedure Close (Source : in out Reader) is null;
   -- procedure Open (Source : in out Reader) is null;
end Project_Name.Readers;
