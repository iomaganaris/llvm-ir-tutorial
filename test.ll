@gv1 = global [4 x i8] [i8 0, i8 1, i8 2, i8 3]
@gv2 = global [4 x i8] [i8 4, i8 5, i8 6, i8 7]
%MyStruct = type { [4 x i8]*, [4 x i8]* }
@struct = global %MyStruct { [4 x i8]* @gv1, [4 x i8]* @gv2 }

@formatString = private constant [2 x i8] c"%d"

define i32 @main() {
entry:
  %d = shl i32 2, 3
  %new_ptr = getelementptr %MyStruct, %MyStruct* @struct, i32 0, i32 1
  %loaded_ptr = load [4 x i8]*, [4 x i8]** %new_ptr
  %goal = getelementptr [4 x i8], [4 x i8]* %loaded_ptr, i32 0, i32 1

  %goal_int = load i8, i8* %goal

  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @formatString , i32 0, i32 0), i8 %goal_int)
  ret i32 1
}

declare i32 @printf(i8*, ...)
