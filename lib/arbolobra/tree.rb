#!/usr/bin/ruby -w
# -*- ruby -*-

require 'arbolobra/node'

class Arbolobra::Tree
  attr_reader :root
  attr_reader :nodes
  
  def initialize lines, separator = "/"
    if lines
      @root = Arbolobra::Node.new "."
      
      lines.each do |line|
        elements = line.chomp.split separator
        create_nodes elements
      end
    end
  end

  def create_nodes elements
    node = @root
    elements.each do |elmt|
      subnode = node.children[-1]
      if subnode && subnode.value == elmt
        node = subnode
      else
        newnode = Arbolobra::Node.new elmt
        node.children << newnode
        node = newnode
      end
    end
  end
end
