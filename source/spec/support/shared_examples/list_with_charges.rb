shared_examples_for "List with charges" do |status, count|
  scenario "User sees #{count} #{status} charges" do
    within("table.#{status} tbody") do
      expect(page.all("tr").count).to eq(count)
    end
  end
end
