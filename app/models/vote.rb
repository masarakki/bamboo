# coding: utf-8
Vote = Struct.new(:id, :title, :image) do
  def self.find(id)
    manifests[id]
  end

  def self.all
    manifests.values
  end

  protected

  def self.manifests
    return @manifest if @manifest
    items = [[1, "吉田沙保里とつくるたけのこの里　発売！", "kasAYYNkBU"],
             [2, "アイドルユニット　恋するたけのこデビュー！", "S4BFseK3Yi"],
             [3, "たけのこの里ホレホレ　体験会！", "zZNSvo2nT2"],
             [4, "AIスピーカーTAKE　開発！", "4eVClBAvyM"],
             [5, "トラック　TAKENOKO.tokyo　発表！", "CgNXoSZIOz"],
             [6, "たけのこの里シリアル　体験会！", "DWhUrz3CGB"],
             [7, "たけのこ急便 THE GOLD　出発！", "34BEa20r2N"]]
    @manifests ||= items.map do |x|
      [x.first, new(*x)]
    end.to_h
  end
end
