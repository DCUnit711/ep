module TicketIssuesHelper

  def nice_severity(level)
    TicketIssue::LEVELS.fetch level.to_sym
  end
end
