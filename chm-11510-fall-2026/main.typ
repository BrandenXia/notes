#import "@preview/tapestry:0.0.4": *
#import "@preview/typsium:0.3.2": *
#import "@preview/physica:0.9.8": hbar

#set page(
  numbering: "1",
)

#show: tapestry.with(
  title: "CHM11510",
  year: "Fall 2026",
)

= Lec 1: Fundamentals 1 -  Aug 25

SI = International System of Units

Different measurement devices provide different levels of precision or uncertainty. Use all known digit plus on estimated digit to properly record the uncertainty in measurement.

Precision - how close the measurements in a series are are to *each other*
Accuracy - how close each measurement are to the *actual value*

Refer to significant figures rules when doing calculations.

= Lec 2: Fundamentals 2 - Aug 27

Total mass of substance does not change during a chemical reaction.

Atom - electrically neutral , spherical entity composed of a positively charged nucleus surrounded by negatively charged electrons.

== Elemental Info from Periodic Table

Atomic number - \# of protons = \# of electrons
Atomic mass - average mass of all nature occurring isotopes of an element

- Number of protons characterizes the element.
- Number of neutrons tells you if the element is an isotope.
- Number of electrons tells you if the element is an ion.

#align(center)[
  #rect[
    $space^A_Z X space$
  ]
]

- $A$ = mass number = \# of protons + \# of neutrons
- $Z$ = atomic number = \# of protons
- $X$ = chemical symbol of the element

$ "atomic mass" = sum "isotope mass" times "fractional abundance" $

== Iconic and Covalent Compounds

Ionic compounds - usually metal + nonmetal, electrically neutral

- Metal atoms tends to lose electrons to form cations
- Nonmetal atoms tends to gain electrons to form anions

Covalent compounds - usually nonmetal + nonmetal, nonmetal bonding

Atoms lose electrons or gain electrons tends to form noble gas configuration (full outer shell of electrons).

Many transition metals form more than one cation.

Polyatomic ions - two or more atoms covalently bonded together with an overall charge.

= Lec 3: Fundamentals 3 - Sep 1

$ 1 "mol" = 6.022 times 10^23 "formula units" = "Avogadro's Number" $

Atomic / Molecular Scale: we use the "atomic mass unit", *amu*

Mass in amu cannot be determined easily using an analytical balance.

Macroscopic Scale: we use the "mole", *mol* and grams, *g*

- *Atomic mass number* - the number of protons and neutrons in a atom.
  - unit: amu
- *Molecular mass* / formula mass - the average mass of a molecule
  - unit: amu
- *Molar mass* - the mass per 1 mole of substance in grams
  - unit: g/mol

= Lec 4: Fundamentals 4 - Sep 3

A balanced chemical equation has the same number of atoms of each element on both sides of the equation.

$ "Percent Yield" = "Actual Yield" / "Theoretical Yield" times 100 $

- The percent yield is always less than or equal to 100%.

= Lec 5: Fundamentals 5 - Sep 10

Solution - homogeneous mixture of two or more substances

#underline[Solvent]
- largest component of the solution
- can be solid, liquid, or gas

#underline[Solute]
- smallest component of the solution
- can be solid, liquid, or gas

== Electrolyte and Nonelectrolyte Solutions

- Some compounds form aqueous solution can conduct electricity
  - compounds that break apart into ions when dissolved in water
  - e.g., #ce("NaCl"), #ce("HCl"), #ce("KOH")

- Some compounds form aqueous solution DO NOT conduct electricity
  - compounds that do not break apart into ions when dissolved in water
  - e.g., sugar, alcoholds

- *Strong electrolytes* dissolve and dissociate completely in water into ions (conduct electricity well)
  - #ce("HCl"), #ce("HNO3"), #ce("HClO4"), #ce("H2SO4"), #ce("NaOH"), #ce("Ba(OH)2"), ionic compounds
- *Weak electrolytes* dissolve and dissociate partially in water into ions (conduct electricity poorly)
  - #ce("CH3COOH"), #ce("HF"), #ce("HNO3"), #ce("NH3"), #ce("H2O")
- *Nonelectrolytes* dissolve in water but do not dissociate into ions (do not conduct electricity)
  - #ce("(NH2)2CO") (urea)
  - #ce("CH3OH") (methanol)
  - #ce("C2H5OH") (ethanol)
  - #ce("C6H12O6") (glucose)
  - #ce("C12H22O11") (sucrose)

== Concentraiton of Solutions

Concentration
- Relative amount of solute and solvent in the solution
- quantitative amount of solute dissolved in solvent or solution

$ "Molarity (M)" = "moles of solute" / "volume of solution (Liters)" $

= Lec 6: Fundamentals 6 - Sep 15

Double replacement reaction - two compounds react to form two new compounds by exchanging ions

General format:

$ A B + C D --> A D + C B $

Example:

$ ce("Al2(SO4)3(aq) + Ba(NO3)2(aq) -> Al(NO3)3(aq) + BaSO4(s)") $

The driving force of the displacement reaction is the formation of a stable product. This can be an insoluble solid precipitate.

- Full chemical equation - shows all reactants and products
- Ionic equation - write out all ions and states
- Net ionic equation - cancel out spectator ions

Neutralization reaction - $"acid" + "base" -> "salt" + "water"$

== Definition of Acid and Base

Acids - substance that produces $"H"^+$ when dissolved in water
- Strong acids ionize completely in water
  - #ce("HCl"), #ce("HBr"), #ce("HI"), #ce("HNO3"), #ce("HClO4"), #ce("H2SO4")
- Monoprotic acids - #ce("HCl"), #ce("HNO3")
- Diprotic acids - #ce("H2SO4")
- Triprotic acids - #ce("H3PO4")

Bases - substance that produces $"OH"^-$ when dissolved in water

= Lec 7: Thermochemistry 1 - Sep 17

$ "Universe" = "System" + "Surroundings" $

$ Delta E = E_"final" - E_"initial" = E_"products" - E_"reactants" $

Law of Conversation of Energy: Energy can be converted from one form to another, but it can be neither created nor destroyed.

$ Delta E_"universe" = Delta E_"system" + Delta E_"surroundings" = 0 $

- Endothermic: Transfer energy into the system
- Exothermic: Transfer energy out of the system

$ Delta E = q + w $

- heat ($q$) energy transferred because of difference in temperature
  - $+$ means system *gains* heat
  - $-$ means system *release* heat
- work ($w$) energy transferred when an object is moved by a force
  - $+$ means work is done *on* the system
  - $-$ means work is done *by* the system

== State Functions: $E$, $H$, $P$, $V$, $T$

*state function* - property of a system that determine only by the system's current state, regardless of how it arrived at that state

- symbols: $E, Delta E$, $H, Delta H$, $P, V, T$
- the change in a state function is independent of the path taken to reach that state

*Enthalpy, $H$* = the total energy or heat content of a system. Enthalpy represents the heat energy tied up in chemical bonds.

$ Delta H = H_"final" - H_"initial" = H_"products" - H_"reactants" $

- *Exo*\thermic reaction: $Delta H < 0$, heat is released
- *Endo*\thermic reaction: $Delta H > 0$, heat is absorbed

= Lec 8: Thermochemistry 2 - Sep 22

- Often the heat absorbed or released by a reaction is expressed in $"J"$ or $"kJ"$.
- Usually the enthalpy change is expressed on a molar basis, in $"kJ/mol"$.

== Ways to Calculate or Determine $Delta H_"rxn"$

+ Calorimetry

  $ q = c dot m dot Delta T quad "and" quad Delta H_"rxn" = q_"rxn" \/ "mol" $

+ Stoichiometry

  Use $Delta H_"rxn"$ provided for the reaction as written.

+ Hess's Law

  Manipulate given reactions with $Delta H_"rxn"$ values to find $Delta H_"rxn"$ for reaction.

+ Use heats of formation ($Delta H^degree_f$)

  $ Delta H^degree_"rxn" = sum_n Delta H^degree_f ("products") - sum_m Delta H^degree_f ("reactants") $

=== Standard Enthalpy of Formation

*Standard enthalpy of formation*: enthalpy change for the chemical reaction when $1 "mol"$ of a compound in its standard state $25 degree"C"$ is produced from its component elements in their *standard states*.

For any physical or chemical process, if values for the standard heats of formation of all the reactants and products are known, the enthalpy change for the process can be calculated.

= Lec 9: Thermochemistry 3 - Sep 24

== Hess's Law of Heat Summation

*Hess's Law* states that the enthalpy change of an overall process is the sum of enthalpy changes of individual steps.

$ Delta H_"overall" = sum_n Delta H_n $

== Stoichiometry of Thermochemical Equations

A *thermochemical equation* is a balanced equation that includes the enthalpy change of the reaction $Delta H_"rxn"$.

- The *sign of $Delta H$* indicates whether the reaction is exothermic or endothermic. Reverse reaction reverses the sign of $Delta H_"rxn"$.

- The *magnitude of $Delta H$* is proportional to the amount of substance.

= Lec 10: Quantum Theory 1 - Sep 29

== The wave Nature of Light

The energy of light is propagated by oscillating electric and magnetic fields as the light moves in space.

- frequency ($v$): number of cycles the wave undergoes per sec ($s^(-1)$ or $"Hz"$)
- wavelength ($lambda$): distance between two "peaks" or "troughs"

Wavelength and frequency are inversely proportional.

$ c = lambda v, quad v = c \/ lambda, quad lambda = c \/ v $

Higher amplitude = brighter = more energy

Lower amplitude = dimmer = less energy

#rect(inset: (x: 15pt, y: 10pt))[
  Planck's Radiation Law:
  $ E = hbar v = (hbar c) / lambda $
  - $E$ - photon energy
  - $hbar$ - Planck's constant
  - $v$ - frequency
  - $lambda$ - wavelength
]

== Electromagnetic Spectrum

The waves of energy have oscillating electric and magnetic fields. Therefore, the radiation is called electromagnetic. There is no clean distinction between the types of light. The transitions are fluid.

*Order of radiation*

- Wave length from shortest to longest
- Frequency from highest to lowest
- Energy from highest to lowest

The order is:
- Gamma ray
- X-ray
- Ultraviolet
- Visible light
- Infrared
- Microwave
- Radio wave

== Diffraction from a Gas Tube

- Electrically exited atoms emit a beam of light that is narrowed by a slit and refracted by a prism
- The line spectrum is a series of fine lines at specific wavelengths separated by black spaces.
- The atomic spectra of elements appear as colored lines. Each spectrum is characteristic for an element.

== Rydberg Equation

The Rydberg equation is a mathematical description that predicts the positions and wavelengths $lambda$ of the spectral lines in a series for an atom with a single electron.

$ 1/lambda = R(1/n_1^2 - 1/n_2^2) $

- $R$ - Rydberg constant
- $n_1$ and $n_2$ are positive integers with $n_2 > n_1$

== The Bohr Model

Niels Bohr hypothesized that electrons orbit the nucleus in circular paths.

- "Bohr orbits" (flat circles) describe the physical motion and position of a one electron system.
- Each electron orbit is assigned a value of $n$.
- The lowest energy orbit is called the ground state ($n = 1$). The higher energy orbits are called excited states ($n = 2, 3, 4, ...$).
- When the electron changes energy levels, it gains or loses energy as electromagnetic radiation (photons).

$ Delta E = E_"final" - E_"Initial" = -2.18 times 10^(-18) J (1/n_"final"^2 - 1/n_"initial"^2) $
