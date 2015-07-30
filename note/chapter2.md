##Chapter2 层次建模的概念##

###设计方法###

1. 自顶向下的设计方法：先定义顶层功能，然后逐步分解成各个子模块。
2. 自底向上的设计方法：对现有的功能块进行分析，然后搭建大一点的模块。

###模块实例###
模块声明类似于一个模板，使用这个模块就可以创建实际的对象。当一个模块被调用的时候，Verilog 会根据模板创建一个唯一的模块对象，每个对象都有其各自的名字、变量、参数和输入/输出（I/O）接口。从模板创建对象的过程称为**实例化(instantiation)**，创建的对象称为**实例（instance）**。

###实例###
**ripple carry counter HDL code, testbench and waveform**

1.加法器

![SV pic](https://github.com/chenpup/HDL/blob/master/picture/tff_sv.png)










