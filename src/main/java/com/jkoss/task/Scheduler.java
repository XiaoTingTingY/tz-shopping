package com.jkoss.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler
{
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

//	// 每隔2秒执行一次
//	@Scheduled(fixedRate = 2000)
//	public void testTasks()
//	{
//		System.out.println("定时任务执行时间：" + dateFormat.format(new Date()));
//	}

	// 每天20分执行
	@Scheduled(cron = "0 0 20 ? * *")
	public void sendEmail()
	{
		System.out.println("定时任务执行时间：" + dateFormat.format(new Date()));
	}
	

}