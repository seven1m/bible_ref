# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class Chinese < Base

      # Is it a single chapter book?
      def has_single_chapter?(reference)
          matches = [/^俄/, /^腓利門/, /^約翰貳/, /^約翰參/, /^猶/]
          return Regexp.union(matches).match?(reference)
      end

      def books
        {
          'GEN' => { match: /^創/, name: '創世紀'},
          'EXO' => { match: /^出/, name: '出埃及記'},
          'LEV' => { match: /^利/, name: '利未記'},
          'NUM' => { match: /^民/, name: '民數記'},
          'DEU' => { match: /^申/, name: '申命記'},
          'JOS' => { match: /^約書/, name: '約書亞記'},
          'JDG' => { match: /^士/, name: '士師記'},
          'RUT' => { match: /^路得/, name: '路得記'},
          '1SA' => { match: /記上$/, name: '撒母耳記上'},
          '2SA' => { match: /記下$/, name: '撒母耳記下'},
          '1KI' => { match: /紀上$/, name: '列王紀上'},
          '2KI' => { match: /紀下$/, name: '列王紀下'},
          '1CH' => { match: /志上$/, name: '歷代志上'},
          '2CH' => { match: /志下$/, name: '歷代志下'},
          'EZR' => { match: /^以斯/, name: '以斯拉記'},
          'NEH' => { match: /^尼/, name: '尼希米記'},
          'EST' => { match: /帖記$/, name: '以斯帖記'},
          'JOB' => { match: /^約伯/, name: '約伯記'},
          'PSA' => { match: /^詩/, name: '詩篇'},
          'PRO' => { match: /^箴/, name: '箴言'},
          'ECC' => { match: /^傳/, name: '傳道書'},
          'SNG' => { match: /^雅歌/, name: '雅歌'},
          'ISA' => { match: /^以賽/, name: '以賽亞書'},
          'JER' => { match: /米書$/, name: '耶利米書'},
          'LAM' => { match: /哀歌$/, name: '耶利米哀歌'},
          'EZK' => { match: /^以西/, name: '以西結書'},
          'DAN' => { match: /^但/, name: '但以理書'},
          'HOS' => { match: /^何/, name: '何西阿書'},
          'JOL' => { match: /^約珥/, name: '約珥書'},
          'AMO' => { match: /^阿/, name: '阿摩司書'},
          'OBA' => { match: /^俄/, name: '俄巴底亞書'},
          'JON' => { match: /^約拿/, name: '約拿書'},
          'MIC' => { match: /^彌/, name: '彌迦書'},
          'NAM' => { match: /^那/, name: '那鴻書'},
          'HAB' => { match: /^哈巴/, name: '哈巴谷書'},
          'ZEP' => { match: /^西/, name: '西番雅書'},
          'HAG' => { match: /^哈該/, name: '哈該書'},
          'ZEC' => { match: /^撒迦/, name: '撒迦利亞書'},
          'MAL' => { match: /^瑪/, name: '瑪拉基書'},
          'MAT' => { match: /^馬太/, name: '馬太福音'},
          'MRK' => { match: /^馬可/, name: '馬可福音'},
          'LUK' => { match: /^路加/, name: '路加福音'},
          'JHN' => { match: /^約翰福/, name: '約翰福音'},
          'ACT' => { match: /^使/, name: '使徒行傳'},
          'ROM' => { match: /^羅/, name: '羅馬書'},
          '1CO' => { match: /多前書$/, name: '哥林多前書'},
          '2CO' => { match: /多後書$/, name: '哥林多後書'},
          'GAL' => { match: /^加/, name: '加拉太書'},
          'EPH' => { match: /^以弗/, name: '以弗所書'},
          'PHP' => { match: /比書$/, name: '腓利比書'},
          'COL' => { match: /^歌/, name: '歌羅西書'},
          '1TH' => { match: /迦前書$/, name: '帖撒羅尼迦前書'},
          '2TH' => { match: /迦後書$/, name: '帖撒羅尼迦後書'},
          '1TI' => { match: /太前書$/, name: '提摩太前書'},
          '2TI' => { match: /太後書$/, name: '提摩太後書'},
          'TIT' => { match: /^提多/, name: '提多書'},
          'PHM' => { match: /門書$/, name: '腓利門書'},
          'HEB' => { match: /^希/, name: '希伯來書'},
          'JAS' => { match: /^雅各/, name: '雅各書'},
          '1PE' => { match: /^彼得前/, name: '彼得前書'},
          '2PE' => { match: /^彼得後/, name: '彼得前書'},
          '1JN' => { match: /壹書$/, name: '約翰壹書'},
          '2JN' => { match: /貳書$/, name: '約翰貳書'},
          '3JN' => { match: /參書$/, name: '約翰參書'},
          'JUD' => { match: /^猶/, name: '猶大書'},
          'REV' => { match: /^啟/, name: '啟示錄'}
        }
      end
    end
  end
end
