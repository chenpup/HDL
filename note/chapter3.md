##chapter3 基本概念##

###X和Z值###

Verilog 用两个符号分别表示不确定值和高阻值，这两个符号在实际电路的建模中是非常重要的。

eg：

12'h13x //这是一个12位的十六进制数，低四位不确定

6’hx    //这是一个6位的十六进制数，所有位都不确定

32'bz   //这是一个32位的高阻值


###数据类型###

连线（线网）由 **wire** 声明，表示硬件单元之间的连接，需要驱动源；

wire a; //声明电路中a是wire(连线)类型

wire d=1'b0;  //连线d在声明时，被赋值为逻辑值0

wire [7:0] bus；//8位的总线

reg clock;//标量寄存器

reg [40:0];//向量寄存器，41位宽的虚拟地址


寄存器用来表示存储元件，它保持原有的数值，直到被改写。**reg**仅仅表示一个保存数值的变量。


####可变的向量域选择####

\[<starting_bit \>+:width]:从起始位开始递增，位宽为width

\[<starting_bit \>-:width]:从起始位开始递减，位宽为width

eg:

reg [255:0] data1;

reg [7:0] byte;

byte = data[31-:8];//从第31位算起，宽度为8位，相当于data1[31:24]

####整数、实数和时间寄存器数据类型####
**整数**

整数是一种通用的寄存器数据类型，用于对数量进行操作，使用关键字integer进行声明。虽然我们可以使用reg类型的寄存器变量作为通用的变量，但声明一个整数类型的变量来完成计数等功能显然更为方便。

eg:

integer counter;

initial

....counter =-1;

**实数**

实常量和实数寄存器数据类型使用关键字real来声明，可以使用十进制或科学计数法来表示。

eg.

real delta;

initial 

begin

....delta=4e10;

end

**时间寄存器**

仿真是按照仿真时间进行的，verilog使用一个特殊的时间寄存器数据类型来保存仿真时间。时间变量通过关键字time来声明。

eg.

time save_sim_time;

**数组**

reg [4:0] port_id[0:7];//由8个端口标识变量组成的数组，每个端口的位宽为5

**参数**
 
verilog 允许使用关键字parameter 在模块内定义常数。参数代表常数，不能像变量那样赋值，但是每个模块实例
的参数值可以在编译阶段被重载。通过使用参数，用户可以更加灵活地对模块进行说明。用户不但可以根据参数来定
义模块，还可以方便地通过参数值重定义来改变模块的行为：通过模块实例化或使用defparam 语句来改变参数值。
verilog 中的局部参数使用关键字localparam 来定义，起作用等同于参数，区别在于它的值不能改变，不能通过参数重载语句（defparam）或通过有序参数序列表或命名参数赋值来


eg.

parameter port_id=5; 

localparam state1=4'b0001;

**系统任务**

$display 是用于显示变量、字符串或表达式的主要系统任务，是verilog中最常用的系统任务之一。

用法:&nbsp;<b>$display(p1,p2,p3,...,pn);</b>

**监视信息**

通过系统函数$monitor，Verilog为用户提供了对信号变化进行动态监视的手段，其用法如下：

用法：&nbsp;&nbsp;monitor(p1,p2,p3...pn)

$monitoron; $monitoroff;

**暂停和结束仿真**
$stop;//暂停

$finish;//结束

**编译指令**

'define

eg:

'define WORD_SIZE 32;

'define S $stop;


'include

使用'include可以在编译期间将一个Verilog源文件包含在另一个Verilog文件中，作用类似于C语言中#include。

eg:

'include header.v


































