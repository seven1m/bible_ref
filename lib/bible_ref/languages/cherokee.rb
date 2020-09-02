# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class Cherokee < Base

      # Is it a single chapter book?
      def has_single_chapter?(reference)
          matches = ['ᏉᎳ ᏆᎵᎹᏂ ᎤᏬᏪᎳᏁᎸᎯ', 'ᏣᏂ ᏔᎵᏁ ᎤᏬᏪᎳᏅᎯ', 'ᏣᏂ ᏦᎢᏁ ᎤᏬᏪᎳᏅᎯ', 'ᏧᏓᏏ ᎤᏬᏪᎳᏅᎯ']
          return matches.any? { |e| reference.include?(e)  }
      end

      def books
        {
          'MAT' => { name: 'ᎣᏍᏛ ᎧᏃᎮᏛ ᎹᏚ ᎤᏬᏪᎳᏅᎯ' },
          'MRK' => { name: 'ᎣᏍᏛ ᎧᏃᎮᏛ ᎹᎦ ᎤᏬᏪᎳᏅᎯ' },
          'LUK' => { name: 'ᎣᏍᏛ ᎧᏃᎮᏛ ᎷᎦ ᎤᏬᏪᎳᏅᎯ' },
          'JHN' => { name: 'ᎣᏍᏛ ᎧᏃᎮᏛ ᏣᏂ ᎤᏬᏪᎳᏅᎯ' },
          'ACT' => { name: 'ᎨᏥᏅᏏᏛ ᏄᎾᏛᏁᎵᏙᎸᎢ' },
          'ROM' => { name: 'ᏉᎳ ᎶᎻ ᎠᏁᎯ ᏧᏬᏪᎳᏁᎸᎯ' },
          '1CO' => { name: 'ᎪᎵᏂᏗᏱ ᎠᏁᎯ ᎢᎬᏱᏱ ᎨᎪᏪᎳᏁᎸᎯ' },
          '2CO' => { name: 'ᎪᎵᏂᏗᏱ ᎠᏁᎯ ᏔᎵᏁ ᎨᎪᏪᎳᏁᎸᎯ' },
          'GAL' => { name: 'ᏉᎳ ᎨᎴᏏᏱ ᎠᏁᎯ ᏧᏬᏪᎳᏁᎸᎯ' },
          'EPH' => { name: 'ᏉᎳ ᎡᏈᏌ ᎠᏁᎯ ᏧᏬᏪᎳᏁᎸᎯ' },
          'PHP' => { name: 'ᏉᎳ ᏈᎵᎩᏱ ᎠᏁᎯ ᏧᏬᏪᎳᏁᎸᎯ' },
          'COL' => { name: 'ᏉᎳ ᎪᎶᏏ ᎠᏁᎯ ᏧᏬᏪᎳᏁᎸᎯ' },
          '1TH' => { name: 'ᏉᎳ ᏕᏏᎶᏂᎦ ᎠᏁᎯ ᎢᎬᏱᏱ ᏧᏬᏪᎳᏁᎸᎯ' },
          '2TH' => { name: 'ᏉᎳ ᏕᏏᎶᏂᎦ ᎠᏁᎯ ᏔᎵᏁ ᏧᏬᏪᎳᏁᎸᎯ' },
          '1TI' => { name: 'ᏉᎳ ᏧᏬᏪᎳᏅᎯ ᎢᎬᏱᏱ ᏗᎹᏗ ᏧᏬᏪᎳᏁᎸᎯ' },
          '2TI' => { name: 'ᏉᎳ ᏧᏬᏪᎳᏅᎯ ᏔᎵᏁ ᏗᎹᏗ ᏧᏬᏪᎳᏁᎸᎯ' },
          'TIT' => { name: 'ᏉᎳ ᏓᏓᏏ ᎤᏬᏪᎳᏁᎸᎯ' },
          'PHM' => { name: 'ᏉᎳ ᏆᎵᎹᏂ ᎤᏬᏪᎳᏁᎸᎯ' },
          'HEB' => { name: 'ᏉᎳ ᎠᏂᏈᎷ ᏧᏬᏪᎳᏁᎸᎯ' },
          'JAS' => { name: 'ᏥᎻ ᎤᏬᏪᎳᏅᎯ' },
          '1PE' => { name: 'ᏈᏓ ᎢᎬᏱᏱ ᎤᏬᏪᎳᏅᎯ' },
          '2PE' => { name: 'ᏈᏓ ᏔᎵᏁ ᎤᏬᏪᎳᏅᎯ' },
          '1JN' => { name: 'ᏣᏂ ᎢᎬᏱᏱ ᎤᏬᏪᎳᏅᎯ' },
          '2JN' => { name: 'ᏣᏂ ᏔᎵᏁ ᎤᏬᏪᎳᏅᎯ' },
          '3JN' => { name: 'ᏣᏂ ᏦᎢᏁ ᎤᏬᏪᎳᏅᎯ' },
          'JUD' => { name: 'ᏧᏓᏏ ᎤᏬᏪᎳᏅᎯ' },
          'REV' => { name: 'ᏣᏂ ᏄᏍᏛ ᎠᏥᎾᏄᎪᏫᏎᎸᎢ' }
        }
      end
    end
  end
end
