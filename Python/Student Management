===========
Description
===========

You are a computer science professor at South Harmon Institute of Technology,
and are in dire need of automatic grading!
The good news is you have all of your student's assignments in an easy-to-read format, making automation easy!

You will be given a list of unique student names, 
and then a list of their assignment grades.
All assignments are based on 20 points and are scored in whole-numbers (integers). 
All students have received the same number of assignments.


========
Solution
========


def student_manager(students):

    number_count =  0
    class_total = 0
    
    for i in range (len(students)):
        print (students[i][0],'Student average =', sum(students[i][1:])/len(students[i][1:]))
        for number in students[i][1:]:
            number_count+=1
            class_total+=number
    print ('Class average =', class_total/number_count)
    
             
