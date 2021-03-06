##chapter8 任务和函数##
###任务###
任务使用关键字task 和endtask 进行声明。如果子程序满足下面任意一个条件，则必须使用任务而不能使用函数：

1. 程序中包含有延迟、时序或者事件控制结构。
2. 没有输出或者输出变量的数目大于1.
3. 没有输入变量

任务在本质上就是静态的，任务中的所有声明项的地址空间都是静态分配的，同时并发执行的多个任务共享这些存储区。因此，如果这个任务在模块中的两个地方被同时调用，则这两个任务调用将对同一块地址空间进行操作。操作的结果可能是错误的。

为了避免这个问题，verilog通过在task关键字前面添加automatic关键字，使任务称为可以重载的，这样声明的任务也称为自动任务。每次调用时，在动态任务中声明的所有模块项的存储空间都是动态分配的，每个调用都对各自独立的地址空间进行操作。这样，每个任务调用只对自己所拥有的独立变量副本进行操作，因此可以得到正确的执行结果。所以，如果某一个任务有可能在程序的两处被同时调用，我们建议使用自动任务。

###函数###
verilog使用关键字function和endfunction来进行函数声明。当下面的条件全部成立，则可以使用函数来完成：

1. 在子程序中不含有延迟、时序或者控制结构；
2. 子程序只有一个返回值；
3. 至少有一个输入变量；
4. 没有输出或者双向变量；
5. 不含有非阻塞赋值语句。

在函数声明中必须至少有一个输入声明，同时由于隐含的寄存器变量function_identifier包含了函数的返回值，因此函数是没有输出变量。另外在函数中不能调用任务，只能调用其他函数。

自动函数与自动任务的用法原理相同，加automatic.

