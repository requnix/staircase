require 'staircase/version'
require 'tree'

module Staircase
  def self.run(description = '')
    $performance_tree ||= Tree::TreeNode.new 'Staircase'

    local_node = Tree::TreeNode.new description
    ($performance_current_node || $performance_tree) << local_node
    $performance_current_node = local_node

    started_at = Time.now
    yield
    ended_at = Time.now

    local_node.content = (ended_at - started_at) * 1000
    $performance_current_node = $performance_current_node.parent unless $performance_current_node == $performance_tree

    if $performance_current_node == $performance_tree
      $performance_tree.each do |node|
        unless node.is_root?
          if node.content
            puts "#{'  ' * (node.level - 1)}#{node.name} (#{'%.2f' % node.content} ms)"
          else
            puts "#{'  ' * (node.level - 1)}#{node.name}"
          end
        end
      end
      $performance_tree = nil
    end
  end

  def self.info(description)
    $performance_tree ||= Tree::TreeNode.new 'Staircase'
    ($performance_current_node || $performance_tree) << Tree::TreeNode.new(description)
  end
end
