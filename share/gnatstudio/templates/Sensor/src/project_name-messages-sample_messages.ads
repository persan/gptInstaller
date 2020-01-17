package Project_Name.Messages.Sample_Messages is

   type Sample_Message is new Project_Name_Message with record
      Name : String (1 .. 10);
      Id   : Integer;
   end record;

   overriding
   function Image (Item : Sample_Message) return String;

   overriding
   function Key (Item : Sample_Message) return Key_Type;

   overriding
   function Constructor (S : not null access Ada.Streams.Root_Stream_Type'Class) return Sample_Message;

private
   Sample_Message_Identifier : constant := 1;
end Project_Name.Messages.Sample_Messages;
