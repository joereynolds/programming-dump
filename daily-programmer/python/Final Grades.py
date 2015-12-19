import math
from operator import itemgetter


grades = {'A':range(90,101),
          'B':range(80,90),
          'C':range(70,80),
          'D':range(60,70),
          'F':range(0,60)}

def get_percentage(student):
    return round(sum_grades(student)/500)

def percent(percentage,n):
    return percentage/100*n
    
def sum_grades(student):
    student = student.split()
    return sum([int(x) for x in student[2:]])*100

def get_grade(student):    
    grade_list = [x for x in grades.keys()]
    student_mark = get_percentage(student)
    
    for grade in grade_list:
        if student_mark in grades[grade]:
            if grade == 'A' or grade == 'F':
                return grade
            if student_mark > max(grades[grade]) - percent(3,max(grades[grade])):
                return grade +'+'
            elif student_mark <= max(grades[grade]) - percent(3,min(grades[grade])):
                return grade +'-'
            else: return grade

def write_report(student):
    report = student.split()
    grades = sorted(report[2:])
    for value in report[2:]:
        report.remove(value)

    for number in grades:
        report.append(number)

    report.insert(2,'('+str(get_percentage(student))+'%)')
    report.insert(3,get_grade(student))

    return report

def write_all():
    for student in students:
        write_report(student)

def sort_grades():
    _all = []

    for student in students:
        _all.append(write_report(student))
    return sorted(_all,key=itemgetter(2),reverse=True)
