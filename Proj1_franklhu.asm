TITLE Project1				(Proj1_franklhu.asm)

; Author: Hunter B. Franklin
; Last Modified: 01/25/2026
; OSU email address: franklhu@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number: 1                 Due Date: 01/25/2026
; Description:	This file performs basic integer arithmetic operations (sum, difference, and product).
;				The program prompts the user to into an x-value and a y-value to complete the basic 
;				calculations, providing insight for the user with status messages and an easy-to-view
;				implementation. This program also does a few tasks included for extra credit. EC #1
;				allows the user to quit or continue the program, EC #2 checks the inputs for descending
;				order, EC #3 handles negative results and calculate Y - X, and EC #4 calculates and displays
;				X / Y (printing both quotient and remainder). 

INCLUDE Irvine32.inc

.data

	; Part 1:
		authorName			BYTE	"Hunter B. Franklin", 0
		programTitle		BYTE	"Basic Arithmetic Program", 0

	; Part 2:
		programInstruction1	BYTE	"This program will calculate the sum, difference, and product", 0
		programInstruction2	BYTE	"of two numbers (X and Y) that you will input.", 0
		programInstruction3	BYTE	"*Note: X must be greater than Y.", 0

	; Part 3:
		promptX				BYTE	"Enter a value for X: ", 0
		promptY				BYTE	"Enter a value for Y (remember, X > Y): ", 0

		valueX				DWORD	?
		valueY				DWORD	?

	; Part 4:
		sumResult			DWORD	?
		differenceResult	DWORD	?
		productResult		DWORD	?

	; Part 5:
		calculationDisplay1	BYTE	"Calculating sum, difference, and product of X and Y now ...", 0
		plus				BYTE	" + ", 0
		minus				BYTE	" - ", 0
		multiply			BYTE	" * ", 0
		equals				BYTE	" = ", 0

	; Part 6:
		goodbye				BYTE	"Calculation is complete. Goodbye!", 0

	; Spacer:
		spacer				BYTE	"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -", 0

	; EC #1:
		extraCredit1		BYTE	"Extra Credit #1: Program allows user to continue playing or quit.", 0
		promptQuit			BYTE	"Press 'q' to quit, or any other key to play again: ", 0
		userChoice			BYTE	?

	; EC #2:
		extraCredit2		BYTE	"Extra Credit #2: Program checks for descending order.", 0
		errorMessage		BYTE	"Error: X must be greater than Y. Please try again.", 0
		orderCheckMessage	BYTE	"Checking order ...", 0
		orderCheckPasses	BYTE	"Validation passed!", 0

	; EC #3:
		extraCredit3		BYTE	"Extra Credit #3: Program now handles negative results and computes Y - X.", 0
		parenthesis1		BYTE	"(", 0
		parenthesis2		BYTE	")", 0
		calculationDisplay2	BYTE	"Calculating Y - X now ...", 0
		differenceYX		DWORD	?

	; EC #4:
		extraCredit4		BYTE	"Extra Credit #4: Program calculates and displays quotient and remainder of X/Y.", 0
		calculationDisplay3	BYTE	"Calculating X/Y and will display quotient and remainder shortly ...", 0
		quotientResult		DWORD	?
		remainderResult		DWORD	?

		stringDivision		BYTE	" / ", 0
		stringRemainder		BYTE	" with a remainder of ... ", 0

.code
main PROC

	; Part 1: Name and Title.
	; * Introduction start:

		MOV EDX, OFFSET authorName				; Displays author name.
		CALL WriteString
		CALL Crlf


		MOV EDX, OFFSET programTitle			; Displays program title.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

	; Part 2: Display Program Instructions.
		MOV EDX, OFFSET programInstruction1		; Displays program instruction one.
		CALL WriteString
		CALL Crlf


		MOV EDX, OFFSET programInstruction2		; Displays program instruction two.
		CALL WriteString
		CALL Crlf


		MOV EDX, OFFSET programInstruction3		; Displays program insturction three.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

	; * Introduction end.

start_loop:										; Bookmark for loop for EC.

	
	; Part 3: Prompt User for X and Y values.
	; * User Input start:
		MOV EDX, OFFSET promptX					; Prompt for x-value. Number turns to EAX
		CALL WriteString						; and gets saved to variable valueX.
		CALL ReadInt
		MOV valueX, EAX


		MOV EDX, OFFSET promptY					; Prompt for y-value. Number turns to EAX
		CALL WriteString						; and gets saved to variable valueY.
		CALL ReadInt
		MOV valueY, EAX

		CALL Crlf								; EC #2 Spacer.

	; * User Input end.

	; EC #2: Check for Descending Order.


		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET authorName				; Re-displays author and program title.
		CALL WriteString
		CALL Crlf
		MOV EDX, OFFSET programTitle
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET extraCredit2			; Displays EC #2 description.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET orderCheckMessage		; Displays checking for order.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EAX, valueX
		CMP EAX, valueY							; Compares input valueX and valueY to check for order.

		JLE HandleError							; If less equal, jumps to error message procedure.

		MOV EDX, OFFSET orderCheckPasses		; If in descending order, program continues.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

	; Part 4: Calculate Sum, Difference, and Product.
	; * Calculations start:

		; Addition:
		MOV EAX, valueX							; Uses ADD to add input valueX and valueY together.
		ADD EAX, valueY
		MOV sumResult, EAX						; Stored result in sumResult variable.


		; Subtraction:
		MOV EAX, valueX							; Uses SUB to subtract input valueY from valueX.
		SUB EAX, valueY	
		MOV differenceResult, EAX				; Stores result in differenceResult variable.


		; Multiplication:
		MOV EAX, valueX							; Uses MUL (pos. only) to multiply valueX by valueY.
		MUL valueY
		MOV productResult, EAX					; Stores result in productResult variable.

	; * Calculations end.

	; Part 5: Display Calculations in Equation Form.
	; * Output Results start:

		; Status Update:

		MOV EDX, OFFSET calculationDisplay1		; Status message.
		CALL WriteString
		CALL Crlf

		CALL Crlf	

		; Addition:								; Displays the addition in equation form as such:
		MOV EAX, valueX
		CALL WriteDec							; Writes valueX.
		MOV EDX, OFFSET plus
		call WriteString						; Writes addition string " + ".
		MOV EAX, valueY
		CALL WriteDec							; Writes valueY.
		MOV EDX, OFFSET equals
		CALL WriteString						; Writes equals string " = ".
		MOV EAX, sumResult
		CALL WriteDec							; Writes result (sumResult).
		CALL Crlf								; Next line.


		; Subtraction:							; Displays the subtraction in equation form as such:
		MOV EAX, valueX
		CALL WriteDec							; Writes valueX.
		MOV EDX, OFFSET minus
		CALL WriteString						; Writes subtraction string " - ".
		MOV EAX, valueY
		CALL WriteDec							; Writes valueY.
		MOV EDX, OFFSET equals
		CALL WriteString						; Writes equals string " = ".
		MOV EAX, differenceResult
		CALL WriteDec							; Writes result (differenceResult).
		CALL Crlf								; Next line.


		; Multiplication:						; Displays the multiplication in equation form as such:
		MOV EAX, valuex
		CALL WriteDec							; Writes valueX.
		MOV EDX, OFFSET multiply
		CALL WriteString						; Writes multiplication string " * ".
		MOV EAX, valueY
		CALL WriteDec							; Writes valueY.
		MOV EDX, OFFSET equals
		CALL WriteString						; Writes equals string " = ".
		MOV EAX, productResult
		CALL WriteDec							; Writes result (productResult).
		CALL Crlf								; Next line.

		CALL Crlf								; Spacer.

	; * Output Results end.

	; EC #3: Calculates valueY minus valueX.

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET authorName				; Re-displays author and program title.
		CALL WriteString
		CALL Crlf
		MOV EDX, OFFSET programTitle
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET extraCredit3			; Displays EC #3 description.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EAX, valueY							; Uses SUB to compute differnce.
		SUB EAX, valueX
		MOV differenceYX, EAX

		; Status update:

		MOV EDX, OFFSET calculationDisplay2		; Status message.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET parenthesis1			; For better viewing.
		CALL WriteString
		MOV EAX, valueY
		CALL WriteInt							; Writes valueX.
		MOV EDX, OFFSET parenthesis2			; For better viewing.
		CALL WriteString
		MOV EDX, OFFSET minus
		call WriteString						; Writes addition string " + ".
		MOV EDX, OFFSET parenthesis1			; For better viewing.
		CALL WriteString	
		MOV EAX, valueX
		CALL WriteInt							; Writes valueY.
		MOV EDX, OFFSET parenthesis2			; For better viewing.
		CALL WriteString
		MOV EDX, OFFSET equals
		CALL WriteString						; Writes equals string " = ".
		MOV EAX, differenceYX
		CALL WriteInt							; Writes result (sumResult).
		CALL Crlf								; Next line.

		CALL Crlf

	; EC #4: Calculates and Displays Quotient and Remainder.

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET authorName				; Re-displays author and program title.
		CALL WriteString
		CALL Crlf
		MOV EDX, OFFSET programTitle
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET extraCredit4			; Displays EC #4 description.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		; Status update:

		MOV EDX, OFFSET calculationDisplay3		; Status message.

		MOV EDX, 0								; Resets EDX.
		MOV EAX, valueX							; Uses DIV to calculate quotient and remainder.
		DIV	valueY
		MOV quotientResult, EAX					; Saves quotient and remainder to set variables.
		MOV remainderResult, EDX

		MOV EAX, valueX
		CALL WriteDec
		MOV EDX, OFFSET stringDivision
		call WriteString						; Writes addition string " / ".
		MOV EAX, valueY
		CALL WriteDec							; Writes valueY.
		MOV EDX, OFFSET equals
		CALL WriteString						; Writes equals string " = ".
		MOV EAX, quotientResult					; Quotient result displayed.
		CALL WriteDec
		MOV EDX, OFFSET stringRemainder			; Remainder string.
		CALL WriteString
		MOV EAX, remainderResult				; Remainder result displayed.
		CALL WriteDec
		CALL Crlf								; Next line.

		CALL Crlf

		JMP CheckQuit							; Jumps to end (EC #1).

HandleError:									; EC #2: Not in descending order procedure.

		MOV EDX, OFFSET errorMessage			; Displays error message for improper order.
		CALL WriteString
		CALL Crlf
		
		CALL Crlf								; Spacer.

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.
		
		JMP start_loop							; Restarts loop if order is incorrect.

	; EC #1: Replay or Quit Program.

CheckQuit:										; Bookmark for EC loop, program complete.

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET authorName				; Re-displays author and program title.
		CALL WriteString
		CALL Crlf
		MOV EDX, OFFSET programTitle
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.

		MOV EDX, OFFSET extraCredit1			; Shows EC #1 description.
		CALL WriteString
		CALL Crlf

		MOV EDX, OFFSET spacer					; String spacer.
		CALL WriteString
		CALL Crlf

		CALL Crlf								; Spacer.
											
		MOV EDX, OFFSET promptQuit				; Displays prompt to quit with 'q' or continue.
		CALL WriteString
		CALL ReadChar
		MOV userChoice, al						; Stores in AL register.
		CALL Crlf

		CALL Crlf								; Loop spacer.

		CMP userChoice, 'q'						; If user choice was any other key but 'q', restarts loop.
		JNE start_loop							; Jumps if not equal.

	; Part 6: Goodbye Message (if loop ends).
	; * Goodbye start:
		MOV EDX, OFFSET goodbye					; Displays goodbye message
		CALL WriteString
		CALL Crlf

	; * Goodbye end.

	Invoke ExitProcess,0						; Exit the operating system.
main ENDP

END main
