# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class Spanish < Base
      def books
        {
          'GEN' => {
            match: /^g[eé]n/,
            name: 'Génesis',
          },
          'EXO' => {
            match: /^[eé]x/,
            name: 'Éxodo',
          },
          'LEV' => {
            match: /^lev/,
            name: 'Levítico',
          },
          'NUM' => {
            match: /^n[uú]m/,
            name: 'Números',
          },
          'DEU' => {
            match: /^deut/,
            name: 'Deuteronomio',
          },
          'JOS' => {
            match: /^jos/,
            name: 'Josué',
          },
          'JDG' => {
            match: /^jue/,
            name: 'Jueces',
          },
          'RUT' => {
            match: /^rut/,
            name: 'Rut',
          },
          '1SA' => {
            match: /^1 sa?m/,
            name: '1 Samuel',
          },
          '2SA' => {
            match: /^2 sa?m/,
            name: '2 Samuel',
          },
          '1KI' => {
            match: /^1 r/,
            name: '1 Reyes',
          },
          '2KI' => {
            match: /^2 r/,
            name: '2 Reyes',
          },
          '1CH' => {
            match: /^1 cr[oó]/,
            name: '1 Crónicas',
          },
          '2CH' => {
            match: /^2 cr[oó]/,
            name: '2 Crónicas',
          },
          'EZR' => {
            match: /^esd/,
            name: 'Esdras',
          },
          'NEH' => {
            match: /^neh/,
            name: 'Nehemías',
          },
          'EST' => {
            match: /^est/,
            name: 'Ester',
          },
          'JOB' => {
            match: /^job/,
            name: 'Job',
          },
          'PSA' => {
            match: /^sal/,
            name: 'Salmos',
          },
          'PRO' => {
            match: /^pro?v/,
            name: 'Proverbios',
          },
          'ECC' => {
            match: /^ecl/,
            name: 'Eclesiastés',
          },
          'SNG' => {
            match: /^cant/,
            name: 'Cantares',
          },
          'ISA' => {
            match: /^isa/,
            name: 'Isaías',
          },
          'JER' => {
            match: /^jer/,
            name: 'Jeremías',
          },
          'LAM' => {
            match: /^lam/,
            name: 'Lamentaciones',
          },
          'EZK' => {
            match: /^ez/,
            name: 'Ezequiel',
          },
          'DAN' => {
            match: /^dan/,
            name: 'Daniel',
          },
          'HOS' => {
            match: /^os/,
            name: 'Oseas',
          },
          'JOL' => {
            match: /^joel/,
            name: 'Joel',
          },
          'AMO' => {
            match: /^am[oó]s/,
            name: 'Amós',
          },
          'OBA' => {
            match: /^abd/,
            name: 'Abdías',
          },
          'JON' => {
            match: /^jon/,
            name: 'Jonás',
          },
          'MIC' => {
            match: /^miq/,
            name: 'Miqueas',
          },
          'NAM' => {
            match: /^nah/,
            name: 'Nahúm',
          },
          'HAB' => {
            match: /^hab/,
            name: 'Habacuc',
          },
          'ZEP' => {
            match: /^sof/,
            name: 'Sofonías',
          },
          'HAG' => {
            match: /^hag/,
            name: 'Hageo',
          },
          'ZEC' => {
            match: /^zac/,
            name: 'Zacarías',
          },
          'MAL' => {
            match: /^mal/,
            name: 'Malaquías',
          },
          'MAT' => {
            match: /^mat/,
            name: 'Mateo',
          },
          'MRK' => {
            match: /^(mar|mc)/,
            name: 'Marcos',
          },
          'LUK' => {
            match: /^luc/,
            name: 'Lucas',
          },
          'JHN' => {
            match: /^juan/,
            name: 'Juan',
          },
          'ACT' => {
            match: /^hec/,
            name: 'Hechos',
          },
          'ROM' => {
            match: /^rom/,
            name: 'Romanos',
          },
          '1CO' => {
            match: /^1 cor/,
            name: '1 Corintios',
          },
          '2CO' => {
            match: /^2 cor/,
            name: '2 Corintios',
          },
          'GAL' => {
            match: /^g[aá]l/,
            name: 'Gálatas',
          },
          'EPH' => {
            match: /^ef/,
            name: 'Efesios',
          },
          'PHP' => {
            match: /^filip/,
            name: 'Filipenses',
          },
          'COL' => {
            match: /^col/,
            name: 'Colosenses',
          },
          '1TH' => {
            match: /^1 te?s/,
            name: '1 Tesalonicenses',
          },
          '2TH' => {
            match: /^2 te?s/,
            name: '2 Tesalonicenses',
          },
          '1TI' => {
            match: /^1 tim/,
            name: '1 Timoteo',
          },
          '2TI' => {
            match: /^2 tim/,
            name: '2 Timoteo',
          },
          'TIT' => {
            match: /^tit/,
            name: 'Tito',
          },
          'PHM' => {
            match: /^fil/,
            name: 'Filemón',
          },
          'HEB' => {
            match: /^heb/,
            name: 'Hebreos',
          },
          'JAS' => {
            match: /^sant/,
            name: 'Santiago',
          },
          '1PE' => {
            match: /^1 ped/,
            name: '1 Pedro',
          },
          '2PE' => {
            match: /^2 ped/,
            name: '2 Pedro',
          },
          '1JN' => {
            match: /^1 juan/,
            name: '1 Juan',
          },
          '2JN' => {
            match: /^2 juan/,
            name: '2 Juan',
          },
          '3JN' => {
            match: /^3 juan/,
            name: '3 Juan',
          },
          'JUD' => {
            match: /^jud/,
            name: 'Judas',
          },
          'REV' => {
            match: /^apo/,
            name: 'Apocalipsis',
          },
        }
      end
    end
  end
end
