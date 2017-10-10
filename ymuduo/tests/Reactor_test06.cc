#include <muduo/net/EventLoop.h>
#include <muduo/net/EventLoopThread.h>

#include <stdio.h>

using namespace muduo;
using namespace muduo::net;

void runInThread()
{
	printf("runInThread():pid = %d, tid = %d\n", getpid(), CurrentThread::tid());
}

int main()
{
	printf("main():pid = %d, tid = %d\n", getpid(), CurrentThread::tid());
	
	EventLoopThread loopThread;
	EventLoop* loop = loopThread.startLoop();
	loop->runInLoop(runInThread);
	sleep(1);
	loop->runAfter(2, runInThread);
	sleep(3);
	loop->quit();
	
	printf("exit main().\n");
}
