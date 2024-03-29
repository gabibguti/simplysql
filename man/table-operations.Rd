% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/table_operations.R
\name{create_sql_table}
\alias{create_sql_table}
\alias{drop_sql_table}
\alias{read_sql_table}
\alias{write_sql_table}
\alias{append_sql_table}
\title{Operate on SQL tables}
\usage{
create_sql_table(name, fields, ..., temporary = FALSE)

drop_sql_table(name, ...)

read_sql_table(name, ...)

write_sql_table(value, name, ...)

append_sql_table(value, name, ...)
}
\arguments{
\item{name}{The table name, passed on to \code{\link[DBI:dbQuoteIdentifier]{dbQuoteIdentifier()}}. Options are:
\itemize{
\item a character string with the unquoted DBMS table name,
e.g. \code{"table_name"},
\item a call to \code{\link[DBI:Id]{Id()}} with components to the fully qualified table name,
e.g. \code{Id(schema = "my_schema", table = "table_name")}
\item a call to \code{\link[DBI:SQL]{SQL()}} with the quoted and fully qualified table name
given verbatim, e.g. \code{SQL('"my_schema"."table_name"')}
}}

\item{fields}{Either a character vector or a data frame.

A named character vector: Names are column names, values are types.
Names are escaped with \code{\link[DBI:dbQuoteIdentifier]{dbQuoteIdentifier()}}.
Field types are unescaped.

A data frame: field types are generated using
\code{\link[DBI:dbDataType]{dbDataType()}}.}

\item{...}{Other parameters passed on to methods.}

\item{temporary}{If \code{TRUE}, will generate a temporary table statement.}

\item{value}{a \link{data.frame} (or coercible to data.frame).}
}
\description{
These functions simply wrap DBI functions to use the standard connection
defined in \code{\link[=start_sql_connection]{start_sql_connection()}}.
\itemize{
\item \code{create_sql_table()} wraps \code{\link[DBI:dbCreateTable]{DBI::dbCreateTable()}}
\item \code{drop_sql_table()} wraps \code{\link[DBI:dbRemoveTable]{DBI::dbRemoveTable()}}
\item \code{read_sql_table()} wraps \code{\link[DBI:dbReadTable]{DBI::dbReadTable()}}
\item \code{write_sql_table()} wraps \code{\link[DBI:dbWriteTable]{DBI::dbWriteTable()}}
\item \code{append_sql_table()} wraps \code{\link[DBI:dbAppendTable]{DBI::dbAppendTable()}}
}
}
\details{
See the \code{DBI} documentation for further information on each function.

\code{name} will be simply interpreted by \code{\link[=sql_identifier]{sql_identifier()}}. If it is a character
string containing a fully qualified name (i.e. \code{my_schema.my_table}), call
\code{sql_identifier()} yourself and set \code{parse = TRUE}.

\code{write_} and \code{append_sql_table()} have the \code{value} argument come first,
before \code{name}. This is an intentional change from their respective DBI
functions, so as to facilitate their use with pipes.
}
