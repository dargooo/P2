--Dargo Wang
--Project4
--I asked www.adaic.org to figure out how to generate random numbers.
--I asked perso.telecom-paristech.fr/pautet/Ada95/chap14.html to figure out printing stuff.

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body radom is

   --2a
   function Bin_To_Int (bArray : BINARY_ARRAY) return Integer is
      Result : Integer := 0;
      Two : Integer := 1;
   begin
      for i in 1 .. 16 loop
         Result := Result + Integer(bArray(17 - i)) * Two;
         Two := Two * 2;
      end loop;
      return Result;
   end Bin_To_Int;
   
   --2b
   function Int_To_Bin (iValue : Integer) return BINARY_ARRAY is
      Result : BINARY_ARRAY;
      Bit : BINARY_NUMBER;
      value : Integer := iValue;
   begin
      for k in 1 .. 16 loop
         Result(k) := 0;
      end loop;
      
      for i in 1 .. 16 loop
         Bit := BINARY_NUMBER(value mod 2);
         value := value / 2;
         Result(17 - i) := Bit;
         exit when value = 0;
      end loop;
      return Result;
   end Int_To_Bin;
          
   --2c1  
   function "+" (Left, Right : BINARY_ARRAY) return BINARY_ARRAY is
      Result : BINARY_ARRAY;
      Cal : Integer;
      Up : Integer := 0;
   begin
      for i in 1 .. 16 loop
         Cal := Integer(Left(17 - i)) + Integer(Right(17 - i)) + Up;
         if Cal = 0 then
            Result(17 - i) := 0;
            Up := 0;
         elsif Cal = 1 then
            Result(17 - i) := 1;
            Up := 0;
         elsif Cal = 2 then
            Result(17 - i) := 0;
            Up := 1;
         else
            Result(17 - i) := 1;
            Up := 1;
         end if;
      end loop;
      return Result;
   end "+";
          
   --2c2  
   function "+" (Left : BINARY_ARRAY; Right : Integer) return BINARY_ARRAY is
      RightArray : BINARY_ARRAY := Int_To_Bin(Right);
   begin
      return Left + RightArray;
   end "+";
   
   --2d1
   function "-" (Left, Right : BINARY_ARRAY) return BINARY_ARRAY is
      Result : BINARY_ARRAY;
      Cal : Integer;
      Borrow : Integer := 0;
   begin
      for i in 1 .. 16 loop
         Cal := Integer(Left(17 - i)) - Integer(Right(17 - i)) - Borrow;
         if Cal = 0 then
            Result(17 - i) := 0;
            Borrow := 0;
         elsif Cal = 1 then
            Result(17 - i) := 1;
            Borrow := 0;
         elsif Cal = -1 then
            Result(17 - i) := 1;
            Borrow := 1;
         else
            Result(17 - i) := 0;
            Borrow := 1;
         end if;
      end loop;
      return Result;
   end "-";
   
   --2d2
   function "-" (Left : BINARY_ARRAY; Right : Integer) return BINARY_ARRAY is
      RightArray : BINARY_ARRAY := Int_To_Bin(Right);
   begin
      return Left - RightArray;
   end "-";

   --3a
   procedure Reverse_Bin_Arr (bArray : in out BINARY_ARRAY) is
      Temp : BINARY_NUMBER;
   begin
      for i in 1 .. 8 loop
         Temp := bArray(i);
         bArray(i) := bArray(17 - i);
         bArray(17 - i) := Temp;
      end loop;
   end Reverse_Bin_Arr;
   
   --3b
   procedure Print_Bin_Arr (bArray : in BINARY_ARRAY) is
   begin
      for i in 1..16 loop
         Put(Integer(bArray(i)), 1);
      end loop;
   end Print_Bin_Arr;
     

end radom;
