# frozen_string_literal: true
module RotateDirections

  # When the rotation is clockwise this gives the corresponding positions that are going to change for all the edges
  # We are returning a hash because it is easier to read and it is also important that we stay consistent with time complexity 
  def f_rotations
    lf_to_u = {
      [0, 2] => [2, 2],
      [1, 2] => [2, 1],
      [2, 2] => [2, 0]
    }.freeze

    u_to_rf = {
      [2, 0] => [0, 0],
      [2, 1] => [1, 0],
      [2, 2] => [2, 0]
    }.freeze

    rf_to_d = {
      [0, 0] => [0, 2],
      [1, 0] => [0, 1],
      [2, 0] => [0, 0]
    }.freeze

    d_to_lf = {
      [0, 2] => [2, 2],
      [0, 1] => [1, 2],
      [0, 0] => [0, 2]
    }.freeze

    {
      :lf_to_u => lf_to_u,
      :u_to_rf => u_to_rf,
      :rf_to_d => rf_to_d,
      :d_to_lf => d_to_lf
    }.freeze

    # [lf_to_u, u_to_rf, rf_to_b, b_to_lf].freeze
  end

  # When the rotation is counter_clockwise this gives the corresponding positions that are going to change for all the edges
  # We are returning a hash because it is easier to read and it is also important that we stay consistent with time complexity 
  # back_rotations
  def f_prime_rotations
    d_to_rf = {
      [0, 0] => [2, 0],
      [0, 1] => [0, 1],
      [0, 2] => [0, 0]
    }.freeze

    rf_to_u = {
      [0, 0] => [2, 0],
      [1, 0] => [2, 1],
      [2, 0] => [2, 2]
    }.freeze

    u_to_lf = {
      [2, 0] => [2, 2],
      [2, 1] => [1, 2],
      [2, 2] => [0, 2]
    }

    lf_to_d = {
      [0, 2] => [0, 0],
      [1, 2] => [0, 1],
      [2, 2] => [0, 2]
    }.freeze

    {
      :d_to_rf => d_to_rf,
      :rf_to_u => rf_to_u, 
      :u_to_lf => u_to_lf, 
      :lf_to_d => lf_to_d
    }.freeze
  end
end
