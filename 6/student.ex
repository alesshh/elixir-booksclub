defmodule Student do
  @moduledoc """
  Define a Student struct and functions to handle a student.
  """
  defstruct name: nil, results: []

  @doc """
  Get the first name of a Student.

  ## Parameters

  - `student` - A Student struct.

  ## Examples

  * john = %Student{name: "John Doe"}
  * Student.first_name(john)
  * "John"
  """
  def first_name(student) do
    student.name
    |>String.split
    |> List.first
  end

  @doc """
  Get the last name of a Student.

  ## Parameters

  - `student` - A Student struct.

  ## Examples

  * john = %Student{name: "John Doe"}
  * Student.last_name(john)
  * "Doe"
  """
  def last_name(student) do
    student.name
    |>String.split
    |> List.last
  end
end
