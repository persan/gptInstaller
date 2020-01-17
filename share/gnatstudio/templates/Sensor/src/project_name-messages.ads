with Ada.Streams;
with Ada.Tags.Generic_Dispatching_Constructor;
package Project_Name.Messages is
   type Key_Type is new Integer range 0 .. 10 with Size => 8; -- Set to apropiate type.

   type Project_Name_Message is interface with
     Input'Class => Input,
       Output'Class => Output;

   function Image (Item : Project_Name_Message) return String is abstract;

   function Input  (S : not null access Ada.Streams.Root_Stream_Type'Class) return Project_Name_Message'Class;
   procedure Output (S : not null access Ada.Streams.Root_Stream_Type'Class; Item :  Project_Name_Message'Class);

   function Key (Item : Project_Name_Message) return Key_Type is abstract;

   function Constructor (S : not null access Ada.Streams.Root_Stream_Type'Class) return Project_Name_Message is abstract;

   function Dispatching_Constructor is new Ada.Tags.Generic_Dispatching_Constructor
     (T           => Project_Name_Message,
      Parameters  => Ada.Streams.Root_Stream_Type'Class,
      Constructor => Constructor);
   procedure Register (Key : Key_Type; Tag : Ada.Tags.Tag);
end Project_Name.Messages;
