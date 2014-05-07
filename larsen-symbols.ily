% LILYPOND SYMBOLS FOR GREY-LARSEN-STYLE IRISH WIND INSTRUMENT ORNAMENTATION

  % Copyright © 2014, Bret Pimentel. http://bretpimentel.com


% HOW TO USE

  % 1. Put this file in the same folder as the .ly file you are working on, or, even better, somewhere in your Lilypond include path.
  % 2. Add the following line near the top of your .ly file, under the "version" line (do not include the percent sign):
  %  \include "bp/larsen-symbols.ily"
  % 3. Add symbols to notes using this syntax (no percent sign):
  %  c\crann
  % The following symbols are available: 
  %    cut
  %    strike
  %    slideUp
  %    slideDown
  %    longRoll
  %    shortRoll
  %    longDoubleCutRoll
  %    shortDoubleCutRoll
  %    crann
  %    shortCrann
  %    trill
  %    singleTrill
  %    shake
  %    breathe
  % ("trill" and "breathe" are already built into Lilypond, but are listed here because they form part of Mr. Larsen's system of symbols.)
  % For a thorough introduction to Mr. Larsen's excellent ornamentation system, buy this book (affiliate link): http://www.amazon.com/gp/product/0786649429/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0786649429&linkCode=as2&tag=bretpimewood-20&linkId=DQYNUO6ZFISH6REA


% OPTIONS -- ADJUST AS DESIRED

  larsenSymbolsScale = #1.5
    % Adjust this to scale all symbols up or down (default #1.5). Known issue: adjusting this affects the spacing of the components of the long and short double-cut roll symbols. 

  larsenSymbolsOutlineWidth = #.065
    % Adjust this to change outline thicknesses for all symbols.

% DON'T CHANGE ANYTHING BELOW HERE UNLESS YOU KNOW WHAT YOU'RE DOING


% SOME VARIABLES
  larsenSymbolsHalignFactor = #(+ (* larsenSymbolsScale ( / 2 3 ) ) .15 ) % this is an arbitrary number discovered by trial and error; it helps keep the symbols roughly aligned with noteheads if the symbols are resized using \larsenSymbolsScale
  larsenSymbolsHalfSize = #(* .5 larsenSymbolsScale)
  larsenSymbolsFlipVertical = #(* -1 larsenSymbolsScale)

% SYMBOL: CUT
  
  cutCoordinates =   #'(
    (.4 .9)
    (.55 .825)
  )

  cutStencil =
    \markup \halign #(/ -3 larsenSymbolsHalignFactor) \stencil
    #(make-connected-path-stencil
      cutCoordinates
      larsenSymbolsOutlineWidth
      larsenSymbolsScale
      larsenSymbolsScale
      #t
      #t
    )

  cut = ^\cutStencil

  tinyCutStencil = % The "tiny cut" is used as a component of some of the more complex symbols
    \markup \stencil
    #(make-connected-path-stencil
      cutCoordinates
      larsenSymbolsOutlineWidth
      larsenSymbolsHalfSize
      larsenSymbolsHalfSize
      #t
      #t
    )

  tinyCut = \tinyCutStencil
  
  tinyCuts =
    \markup
      \halign #(/ -6.25 larsenSymbolsHalignFactor) \raise #(/ .35 larsenSymbolsHalignFactor)
      \combine
        \tinyCut
        \halign #(/ .25 larsenSymbolsHalignFactor) \raise #(/ .2 larsenSymbolsHalignFactor) \tinyCut

% SYMBOL: STRIKE

  strikeStencil = \markup \halign #(/ -1.75 larsenSymbolsHalignFactor) \stencil
    #(make-connected-path-stencil
      '(
        (.234 .831)
        (.156 .831)
        (-.012 .317)
        (-.156 .831)
        (-.293 .831)
       )
      larsenSymbolsOutlineWidth
      larsenSymbolsScale
      larsenSymbolsScale
      #t
      #t
    )
  
  strike = ^\strikeStencil

% SYMBOLS: SLIDES

  slideCoordinates =  #'(
      (.563 .001 .75 .189 .75 .751)
      (.563 .189 .563 .189 0 0)
    )
  
  slideUpStencil =
    \markup \halign #(/ -1.5 larsenSymbolsHalignFactor) \stencil
    #(make-connected-path-stencil
      slideCoordinates
      larsenSymbolsOutlineWidth
      larsenSymbolsScale
      larsenSymbolsScale
      #t
      #t
    )
  
  slideUp = ^\slideUpStencil  

  slideDownStencil =
    \markup \halign #(/ -1.5 larsenSymbolsHalignFactor) \stencil
    #(make-connected-path-stencil
      slideCoordinates
      larsenSymbolsOutlineWidth
      larsenSymbolsScale
      larsenSymbolsFlipVertical
      #t
      #t
    )

  slideDown = ^\slideDownStencil

% SYMBOL: LONG ROLL

  longRollStencil = \markup \halign #(/ -.9 larsenSymbolsHalignFactor) \stencil
    #(make-connected-path-stencil
      '(
        (.25 .6 .95 .6 1.2 0)
        ( 1.15 .75 .05 .75 0 0)
       )
      larsenSymbolsOutlineWidth
      larsenSymbolsScale
      larsenSymbolsScale
      #t
      #t
    )
  
  longRoll = ^\longRollStencil
  
% SYMBOL: SHORT ROLL

  shortRollCombo = 
    \markup
    \combine
      \longRollStencil
      \cutStencil
  
  shortRoll = ^\shortRollCombo

% SYMBOL: LONG DOUBLE-CUT ROLL

  longDoubleCutRoll =
    ^\markup
      \combine
        \longRollStencil
        \tinyCuts

% SYMBOL: SHORT DOUBLE-CUT ROLL

  shortDoubleCutRoll =
    ^\markup
      \combine
        \shortRollCombo
        \tinyCuts

% SYMBOL: CRANN

  crannStencil = \markup \halign #(/ -1.5 larsenSymbolsHalignFactor) \stencil
    #(make-connected-path-stencil
      '(
        (.054 -.007 .032 .107 .032 .1)
        (.032 .05 .099 0 .049 0)
        (-.451 -.025 -.701 .175 -.695 .375)
        (-.701 .575 -.451 .775 .049 .75)
        (.099 .75 .032 .7 .032 .650)
        (.032 .643 .054 .758 -.001 .75)
        (-.376 .7 -.564 .537 -.551 .375)
        (-.564 .213 -.376 .05 -.001 0)
       )
      larsenSymbolsOutlineWidth
      larsenSymbolsScale
      larsenSymbolsScale
      #t
      #t
    )
  
  crann = ^\crannStencil

% SYMBOL: SHORT CRANN

  shortCrann = 
  ^\markup
    \combine
      \crannStencil
      \halign #(/ -2.25 larsenSymbolsHalignFactor) \cutStencil

% SYMBOL: SINGLE TRILL

  singleTrill = ^+ % This one is really just an alias for an existing symbol.

% SYMBOL: SHAKE

  shakeStencil =
  \markup \halign #(/ -.9 larsenSymbolsHalignFactor) \stencil
  #(make-connected-path-stencil
    '(
      (-.4 -.5)
      (-.85 -.15)   
      (-1.25 -.45)   
      (-.85 .05)   
      (-.4 -.3)
     )
    larsenSymbolsOutlineWidth
    larsenSymbolsScale
    larsenSymbolsScale
    #t
    #t
  )
  
  shake = ^\shakeStencil