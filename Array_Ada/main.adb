--Dargo Wang
--Project4
--I asked www.adaic.org to figure out how to generate random numbers.
--I asked perso.telecom-paristech.fr/pautet/Ada95/chap14.html to figure out printing stuff.

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with radom; use radom;

procedure Main is

   iValue : Integer;
   iValue2 : Integer;
   iValue3 : Integer;
   b_Array_1 : BINARY_ARRAY;
   b_Array_2 : BINARY_ARRAY;
   b_Array_3 : BINARY_ARRAY;
   b_Array_4 : BINARY_ARRAY;

   --Random bit number generator
   procedure PickBit is
      package Random_Bit is new Ada.Numerics.Discrete_Random (BINARY_NUMBER);
      use Random_Bit;
      G1 : Generator;
   begin
      Reset(G1);
      for i in 1 .. 16 loop
         b_Array_1(i) := Random(G1);
      end loop;
   end PickBit;

   --Random int number generator
   procedure PickInt is
      subtype IntRange is Integer range 1..1000;
      package Random_Int is new Ada.Numerics.Discrete_Random (IntRange);
      use Random_Int;
      G2 : Generator;
   begin
      Reset(G2);
      iValue3 := Integer(Random(G2));
   end PickInt;

begin
   --a
   PickBit;
   Put("Printing Random Array b_Array_1: ");
   New_Line;
   Print_Bin_Arr(b_Array_1);
   New_Line(2);

   --b
   iValue := Bin_To_Int(b_Array_1);
   Put("Printing Integer Value of b_Array_1: ");
   New_Line;
   Put(iValue, 1);
   New_Line(2);

   --c
   PickInt;
   iValue2 := iValue3;
   b_Array_2 := Int_To_Bin(iValue2);

   --d
   Put("Printing Array Created from Int_To_Bin function: Int_To_Bin(");
   Put(iValue2, 1); Put("): ");
   New_Line;
   Print_Bin_Arr(b_Array_2);
   New_Line(2);

   --e--1
   b_Array_3 := b_Array_1 + b_Array_2;
   Put("Printing Value of b_Array_1 + b_Array_2, first + overload: ");
   New_Line;
   Put("Int value of b_Array_1: "); Put(iValue, 1);
   New_Line;
   Put("Int value of b_Array_2: "); Put(iValue2, 1);
   New_Line;
   Put("Int value of b_Array_3: "); Put((iValue + iValue2), 1);
   New_Line;
   Put("Binary value of b_Array_3: "); Print_Bin_Arr(b_Array_3);
   New_Line(2);

   --e--2
   PickInt;
   Put("Printing Value of Int_To_Bin("); Put(iValue3, 1); Put(") + b_Array_3, second + overload: ");
   New_Line;
   b_Array_3 := b_Array_3 + iValue3;
   Put("Int value of b_Array_3 after addition: "); Put(Bin_To_Int(b_Array_3), 1);
   New_Line;
   Put("Current binary value of b_Array_3: "); Print_Bin_Arr(b_Array_3);
   New_Line(2);

   --f--1
   b_Array_4 := b_Array_1 - b_Array_2;
   Put("Printing Value of b_Array_1 - b_Array_2, first - overload: ");
   New_Line;
   Put("Int value of b_Array_1: "); Put(iValue, 1);
   New_Line;
   Put("Int value of b_Array_2: "); Put(iValue2, 1);
   New_Line;
   Put("Int value of b_Array_4: "); Put((iValue - iValue2), 1);
   New_Line;
   Put("Binary value of b_Array_4: "); Print_Bin_Arr(b_Array_4);
   New_Line;
   Put("( Note, this value will be incorrect if first number is smaller than second. )");
   New_Line(2);

   --f--2
   PickInt;
   Put("Printing Value of b_Array_1 - Int_To_Bin("); Put(iValue3, 1); Put("), second - overload: ");
   New_Line;
   b_Array_4 := b_Array_1 - iValue3;
   Put("Int value of b_Array_4 after substraction: "); Put(Bin_To_Int(b_Array_4), 1);
   New_Line;
   Put("Current binary value of b_Array_4: "); Print_Bin_Arr(b_Array_4);
   New_Line(2);

   --g
   Reverse_Bin_Arr(b_Array_4);
   Put("Reversing and Printing b_Array_4: ");
   New_Line;
   Print_Bin_Arr(b_Array_4);
   New_Line(2);
end Main;
