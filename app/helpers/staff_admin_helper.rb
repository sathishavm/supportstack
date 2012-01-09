module StaffAdminHelper
def department_for_select
  Department.all.collect { |m| [m.name, m.id] }
end
end
