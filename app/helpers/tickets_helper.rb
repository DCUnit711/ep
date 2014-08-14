module TicketsHelper

  def ticket_status(ticket, type)
    if type == 'list-group'
      status = 'list-group-item-'
    elsif type == 'panel'
      status = 'panel-'
    else
      status = ''
    end

    if ticket.ticket_issues.first.nil?
      status += 'warning'
      return status
    elsif
      ticket.ticket_issues.each do |issue|
        if issue.resolved.nil?
          status += 'danger'
          return status
        end
      end
    end

    status += 'success'
  end

  def count_open_tickets(tickets)
    count = 0
    tickets.each do |ticket|
      ticket.ticket_issues.each do |issue|
        if issue.resolved.nil?
          count += 1
          break
        end
      end
      if ticket.ticket_issues.first.nil?
        count += 1
      end
    end
    count
  end

  def ticket_resolved(ticket)
    if ticket.ticket_issues.first.nil?
      return false
    end

    ticket.ticket_issues.each do |issue|
      if issue.resolved.nil?
        return false
      end
    end
    return true
  end

  def issue_status(issue)
    if issue.resolved_employee_id.nil?
      status = 'list-group-item-danger'
    else
      status = 'list-group-item-success'
    end
  end

  def issue_resolved(issue)
    if issue.resolved_employee_id.nil?
      return false
    else
      return true
    end
  end

  def unique_ticket(ticket)
    identifier = ticket.id
  end

  def find_issue(ticket)
    if ticket.ticket_issues.first.nil?
      issue = 'No issues yet'
    else
      issue = ticket.ticket_issues.first.issue_type.issue
    end
  end

  def any_issues(ticket)
    if ticket.ticket_issues.first.nil?
      collapse = 'collapse-in'
    else
      collapse = 'collapse'
    end
  end

  def show_button(ticket)
    if ticket.ticket_issues.first.nil?
      return false
    elsif ticket.ticket_issues.nil?
      return false
    else
      return true
    end
  end

  def column(ticket)
    size = 12 / ticket.ticket_issues.count
    column = 'col-md-'
    column += size.to_s
    column
  end

  def ticketable_info(ticket)
    return ticket.ticketable_type
    if ticket.ticketable_type == 'Printer'
      return 'printer_info'
    elsif ticket.ticketable_type == 'Computer'
      return 'computer_info'
    else
      return 'print_station_info'
    end
  end
end
