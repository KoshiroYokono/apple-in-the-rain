def create_table(table_name, args = {})
  args = args.merge(charset: "utf8mb4")
  super(table_name, args) do |t|
    yield(t)
    t.timestamps
  end
end
