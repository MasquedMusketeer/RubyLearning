taskList = []
taskStatus = []
taskMenu = ["---Ruby Task List---", '1 - Add Task', "2 - Delete Task", "3 - View progress", "0 - Close App"]

def showMenu(menuString)
  menuString.each do |string|
    puts string
  end
end

def addTask(taskList,taskStatus)
  puts "Type the task to be added:"
  taskString = gets.chomp
  taskList << taskString
  taskStatus << "In The Making"
end

def deleteTask(taskList,taskStatus)
  puts "Type the number of the task to be deleted:"
  taskNum = (gets.chomp).to_i
  taskList.each do |string|
      taskList.delete_at(taskNum - 1)
      taskStatus.delete_at(taskNum - 1)
  end
  puts "Entry #{taskNum} was deleted from queue."
end

taskCounter = 0
def showTask(taskList,taskStatus,taskCounter)
  fullTask = ""
  if taskList.empty?
    puts "List is empty"
  else
    taskList.zip(taskStatus) do |string,stats|
        taskCounter += 1
        fullTask << (taskCounter.to_s + " . " + string + " -> " + stats)
        puts fullTask
    end
  end
end

loop do
  showMenu(taskMenu)
  input = gets.chomp
  case input
  when "1"
    addTask(taskList,taskStatus)
  when "2"
    deleteTask(taskList,taskStatus)
  when "3"
    showTask(taskList,taskStatus,taskCounter)
  when "0"
    break
  else
    puts "Invalid Option"
  end
end
