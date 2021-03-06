drop table if exists task_child_task;
drop table if exists task_runs;
drop table if exists tasks;
create table task_child_task (task_id bigint not null, child_task_id bigint not null, primary key (task_id, child_task_id)) engine=InnoDB;
create table task_runs (id bigint not null auto_increment, endDate datetime, stackTrace text, startDate datetime, status varchar(255), sysErr text, sysOut text, taskId bigint not null, version integer not null, primary key (id)) engine=InnoDB;
create table tasks (id bigint not null auto_increment, beanName varchar(255) not null, command varchar(255), description text, enabled bit not null, errorIfRunning bit not null, groupName varchar(255) not null, name varchar(255) not null, notifyOnFailure bit, notifyOnSuccess bit, recipients text, priority integer, stopOnError bit, timeZone varchar(255), timerSchedule varchar(255), version integer not null, primary key (id)) engine=InnoDB;
alter table task_child_task add index FK3A35B5C2831F2EC2 (task_id), add constraint FK3A35B5C2831F2EC2 foreign key (task_id) references tasks (id);
alter table task_child_task add index FK3A35B5C27809EE9F (child_task_id), add constraint FK3A35B5C27809EE9F foreign key (child_task_id) references tasks (id);
create index i_task_runs_taskId_startDate on task_runs (taskId, startDate);
