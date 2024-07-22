class Series
  attr_accessor :series
  def initialize(str)
    self.series = str
  end

  def slices(slice_len)
    raise ArgumentError if slice_len > series.size
    n_series = sub_series(slice_len)
    sub_series_to_slices(n_series)
  end

  def to_slice
    series.chars.map(&:to_i)
  end

  private

  def sub_series(sub_series_len)
    n_series = []
    idx = 0
    while idx < series.size
      next_idx = idx + (sub_series_len - 1)
      break if next_idx >= series.size
      n_series << Series.new(series[idx..next_idx])
      idx += 1
    end
    n_series
  end

  def sub_series_to_slices(n_series)
    n_series.map(&:to_slice)
  end

end
