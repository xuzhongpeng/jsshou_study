#include<iostream> //标准输入输出流库
using namespace std;//c++命名空间
int main()  //c++主函数,是程序执行的起点
{
   char name[50];
   cout << "请输入您的名称： ";
   cin >> name;
   cout << "您的名称是： " << name << endl;
}