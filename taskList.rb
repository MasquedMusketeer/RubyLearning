taskList = []
taskStatus = []
taskMenu = ["---Ruby Task List---", '1 - Add Task', "2 - Delete Task", "3 - View rogress", "0 - Close App"]

def numCorrection(taskList,taskStatus,taskNum)

end

def showMenu(menuString)
  menuString.each do |string|
    puts string
  end
end

def addTask(taskList,taskStatus)
  puts "Type the task to be added:"
  taskString = gets.chomp
  taskBuffer = ""
  taskNum = taskMenu.size + 1
  taskBuffer << (taskNum + " . " + taskString)
  taskList << taskBuffer
  taskStatus << "In The Making"
end

def deleteTask(taskNum,taskList,taskStatus)
  taskList.each do |string|
    if string.include?(taskNum)
      taskList.delete_at(taskNum - 1)
      taskStatus.delete_at(taskNum - 1)
      numCorrection(taskList,taskStatus,taskNum)
    end
    puts "Entry #{taskNum} was deleted from queue."
  end
end

loop do
  showMenu(taskMenu)
  input = gets.chomp
  case input
  when 1
    addTask(taskList,taskStatus)
end