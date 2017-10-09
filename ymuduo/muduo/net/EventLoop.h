// Copyright 2010, Shuo Chen.  All rights reserved.
// http://code.google.com/p/muduo/
//
// Use of this source code is governed by a BSD-style license
// that can be found in the License file.

// Author: Shuo Chen (chenshuo at chenshuo dot com)
//
// This is a public header file, it must only include public header files.

#ifndef MUDUO_NET_EVENTLOOP_H
#define MUDUO_NET_EVENTLOOP_H

#include <vector>

#include <boost/noncopyable.hpp>
#include <boost/scoped_ptr.hpp>

#include <muduo/base/Mutex.h>
#include <muduo/base/Thread.h>
#include <muduo/base/Timestamp.h>
#include <muduo/net/Callbacks.h>
#include <muduo/net/TimerId.h>

namespace muduo
{
namespace net
{
class Channel;
class Poller;
class TimerQueue;
///
/// Reactor, at most one per thread.
///
/// This is an interface class, so don't expose too much details.
class EventLoop : boost::noncopyable
{
 public:
  typedef boost::function<void()> Functor;
	 
  EventLoop();
  ~EventLoop();  // force out-line dtor, for scoped_ptr members.

  ///
  /// Loops forever.
  ///
  /// Must be called in the same thread as creation of the object.
  ///
  void loop();

  void quit();
  
  Timestamp pollReturnTime() const { return pollReturnTime_; }
  
  //run cb immediately in the loop thread
  //call from other threads, cb will be added into pendingFunctors_,
  //when doPendingFunctors() is called, pendingFunctors_ will be called
  void runInLoop(const Functor &cb);
  //add functors to pendingFunctors_
  void queueInLoop(const Functor &cb);
  
  //timers
  ///runs callback at 'time'
  ///safe to call from oter threads
  TimerId runAt(const Timestamp &time, const TimerCallback &cb);
  
  ///runs callback after delay seconds
  ///safe to call from oter threads
  TimerId runAfter(double delay, const TimerCallback &cb);
  
  ///runs callback every interval seconds
  ///safe to call from oter threads
  TimerId runEvery(double interval, const TimerCallback &cb);
  
  ///cancels the timer
  ///safe to call from oter threads
  void cancel(TimerId timerid);
  
  void wakeup();
  void updateChannel(Channel *channel); //add more channels to Poller
  void removeChannel(Channel *channel); //remove channel from Poller
  
  void assertInLoopThread()
  {
    if (!isInLoopThread())
    {
      abortNotInLoopThread();
    }
  }
  bool isInLoopThread() const { return threadId_ == CurrentThread::tid(); }

  static EventLoop* getEventLoopOfCurrentThread();

 private:
  void abortNotInLoopThread();
  void handleRead();
  void doPendingFunctors();
  
  void printActiveChannels() const;
  
  typedef std::vector<Channel*> ChannelList;
  
  bool looping_; /* atomic */
  bool quit_; /* atomic */
  bool eventHandling_; /*atomic*/
  bool callingPendingFunctors_;
  const pid_t threadId_;
  Timestamp pollReturnTime_;
  boost::scoped_ptr<Poller> poller_;
  boost::scoped_ptr<TimerQueue> timerQueue_;
  int wakeupFd_;
  boost::scoped_ptr<Channel> wakeupChannel_;
  ChannelList activeChannels_;
  Channel *currentActiveChannel_;
  MutexLock mutex_;
  std::vector<Functor> pendingFunctors_;
};

}
}
#endif  // MUDUO_NET_EVENTLOOP_H
