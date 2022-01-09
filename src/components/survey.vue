<template>
    <div>
    <div v-if="step === 0" class = heatMap>
      <div style="text-align: center; border:4px solid black;">
          <h2>“Was uns beim Einsatz des Unkrautroboters gefehlt hat, <br> ist ein anderer Landwirt aus der Region mit Erfahrung”</h2>
      </div> 
        <div style="border: 4px solid black; padding: 5px">
            <ul>
              <li>Zuckerrüben sind immer mehr von Wirkstoffverlusten in Pflanzenschutzmitteln betroffen und Landwirte und Landwirtinnen brauchen Alternativen. Bei der Suche nach Alternativen ist es oft hilfreich zu schauen, was Berufskollegen und -kolleginnen in der Region machen. </li>
              <br>
              <li>Wir möchten wissen, wie Sie sich zu diesem Thema mit Ihren Berufskollegen und -kolleginnen austauschen. </li>
               <ul>
                  <li>Wie wird Unkraut in Zuckerrüben aktuell bekämpft?</li>
                  <li>Welche Rolle spielen neue Techniken wie kameragesteuerter Hacken?</li>
                  <li>Nutzen Landwirte und Landwirtinnen in räumlicher Nähe zueinander die gleichen Techniken?</li>
                  <li><b>Egal wie Sie Ihr Unkraut bekämpfen – es interessiert uns!</b></li>
               </ul>
              <br>
              <li>Als Landwirt/in haben Sie online die Möglichkeit, <b>anonym</b> Angaben zur Unkrautbekämpfung und ihrem räumlichen Umfeld in eine Datenbank einzutragen, um so Ihre eigenen Werte mit denen Ihrer Berufskollegen und -kolleginnen in ganz Deutschland zu vergleichen. Damit tragen Sie aktiv dazu bei, praxistaugliche Alternativen für die Bekämpfung von Unkräutern in Zuckerrüben zu entwickeln, die den Ansprüchen der Landwirte und Landwirtinnen entsprechen.</li>
              <br>
              <li style="font-size: 16px; color: #DD0000"><b><i>Unter je 100 Teilnehmern werden drei Gutscheine im Wert von 50 € für Engelbert Strauss verlost.</i></b></li>
            </ul>  
        </div>
         <div style="margin: 0px; padding: 5px; border:4px solid black">
           <h2 style="text-align: center">Karte</h2>
          <ul>
            <li>Klicken Sie auf die jeweilige Rubrik um zu sehen, wie die Verteilung in Deutschland ist.
            <br/>
            Zur Orientierung sind die großen Zuckerrübenfabriken eingezeichnet.</li>
            <br/>
            <li>Ihre Daten werden so zusammengefasst auch für andere Teilnehmer der Umfrage zu sehen sein.
            <br/>
            Es können keine Rückschlüsse auf individuelle Betriebe gezogen werden.</li>
         </ul>            
        <br/>
         <section>
              <legend style="font-size: 15px">
              Bitte wählen sie eine mechanische Unkrautbekämpfungmethode?
              </legend>
            <select class="bootstrap-select" style="width: 15em; border: 2px black solid"
              v-model="chosen_technique">             
              <option value="choose">Bitte auswählen</option>
              <option value="Alle Techniken">Alle Techniken</option>
              <option value="Striegel">Striegel</option>
              <option value="Hackstriegel">Hackstriegel</option>
              <option value="Reihenstriegel">Reihenstriegel</option>
              <option value="Rotorstriegel">Rotorstriegel</option>
              <option value="Scharhacke">Scharhacke</option>
              <option value="Trennhacke">Trennhacke</option>
              <option value="Rollhacke">Rollhacke</option>
              <option value="Fingerhacke">Fingerhacke</option>
              <option value="Kombination Hacke-Bandspritze">Kombination Hacke-Bandspritze</option>
              <option value="Häufelgerät">Häufelgerät</option>
              <option value="Hackbürste">Hackbürste</option>
              <option value="Hackfräse">Hackfräse</option>
            </select>
            </section>
        </div>
       <div style="border: 4px solid black; padding: 5px">
      <keep-alive>
            <heatmapbox v-bind:heatmap-data="heatmap_coords" :selected-technique="chosen_technique">
            </heatmapbox>
      </keep-alive>
     </div>
      <div style="padding: 5px">
    <button style="background-color: green;
                        color: white;
                        left: 250px;
                        height:100px;
                        position: relative;
                        width:290px;
                        padding: 15px 32px;
                        text-align: center;
                        text-decoration: none;
                        display: inline-block;
                        font-size: 22px;
                        margin: 4px 2px;" @click.prevent="next()">zur Umfrage</button>
    </div>
   </div>
      
    <div v-if="step === 1" class = firstPage>
            <section>
                    <div style="margin: 5px; padding: 5px; border: 4px solid black;">
                        <p>
                        Die Umfrage wird max. 10 Minuten in Anspruch nehmen. 
                        Alle Ergebnisse werden anonymisiert analysiert. 
                        Wenn Sie möchten, senden wir Ihnen die zusammengefassten Ergebnisse der Studie zu. 
                        Dazu können Sie im Anschluss an die Studie Ihre persönlichen Daten angeben.
                        </p>
                        <p>
                        Bei Fragen wenden Sie sich bitte an:
                        <br>
                        <br>
                        Anna Massfeller
                        <br/>
                        Doktorandin am Institut für Lebensmittel- und Ressourcenökonomik, Universität Bonn
                        <br />
                        E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #8ebf65">anna.massfeller@ilr.uni-bonn.de</a> 
                      </p>
                   </div>
                   <div style="margin: 5px; padding: 5px; border: 4px solid black;">
                      <ul style="position: relative; margin: 2px; padding: 10px">
                        <li>
                        Die in der Umfrage gewählte männliche Form bezieht sich immer zugleich auf weibliche, diverse und männliche Personen.
                        </li>
                        <li>
                        Um die Umfrage zu öffnen, akzeptieren Sie bitte unsere Datensicherheitserklärung.
                        </li>
                      </ul>
                  </div>
                  <!-- margin:auto ;display:block -->
                    <button v-on:click="isHidden = !isHidden" style="width: 220px; height: 45px;font-weight: bold;">Datensicherheitserklärung anzeigen</button>
                      <div v-if="isHidden">
                      <div style="border:3px solid black; margin:10px; padding:10px" lang="de-DE" >
                      <br>
                      <h3 class="western" align="center">Einverständniserklärung in die Erhebung und Verarbeitung von Daten</h3>
                <br/>
                <p align="center" style="font-size: 12pt"><i>Durch</i></p>
                <br/>
                <p align="center" style="font-size: 12pt"><b>- Institut für Lebensmittel-
                und Ressourcenökonomik (ILR)</b> -</p>
                <p align="center"><i>Landwirtschaftliche
                Fakultät der Universität Bonn</i></p>
                <br/>
                <p style="margin-bottom: 0in; line-height: 108%">Für die Umfrage
                „Mechanische Unkrautbekämpfung in Zuckerrüben“ erfolgt die
                Erhebung und Verarbeitung folgender personenbezogener Daten:
                <ul>
                  <li>Alter</li>
                  <li>Angaben zumBetrieb</li>  
                  <li>E-Mail-Adresse (nur wenn Information zu den Ergebnissen der Umfrage gewünscht ist)</li>
                </ul></p>
                <p style="margin-bottom: 0in; text-align:justify; line-height: 108%">Die erhobenen Daten
                werden nicht an Dritte weitergegeben bzw. übermittelt und nur im
                internen Universitätsnetz (Server des ILR) gespeichert.</p>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Die Daten werden bei
                dem Institut für Lebensmittel- und Ressourcenökonomik für die
                Dauer des Zwecks der Datenerhebung gespeichert und können nur von
                dazu berechtigten Personen eingesehen werden. Nach Wegfall des Zwecks
                werden die Daten gelöscht.</p>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <p style="margin-bottom: 0in; line-height: 108%"><font size="3" style="font-size: 12pt"><b>Nutzerrechte:</b></font></p>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Die bzw. der
                Unterzeichnende hat das Recht, diese Einwilligung jederzeit ohne
                Angabe einer Begründung mit
                Wirkung für die Zukunft zu widerrufen. Weiterhin können die
                erhobenen Daten bei Bedarf korrigiert,
                gelöscht oder deren Erhebung eingeschränkt werden. Auf Anfrage kann
                unter der untenstehenden
                Adresse eine detaillierte Auskunft über den Umfang der vorgenommenen 
                Datenerhebung verlangt werden. Auch kann eine Datenübertragung angefordert 
                werden sollte die bzw. der
                Unterzeichnende eine Übertragung ihrer bzw. seiner Daten an eine
                dritte Stelle wünschen. Es kann bei Verstößen gegen den
                Datenschutz zudem Beschwerde bei der Aufsichtsbehörde erhoben werden.</p>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <p style="margin-bottom: 0in; line-height: 108%"><font size="3" style="font-size: 12pt"><b>Freiwilligkeit
                / Folgen des Nicht-Unterzeichnens:</b></font></p>

                <p style="margin-bottom: 0in;text-align: justify; line-height: 108%">Die Einwilligung zur
                Datenverarbeitung erfolgt freiwillig. Die bzw. der Unterzeichnende
                hat das Recht, dieser
                Einwilligungserklärung nicht zuzustimmen. Da für den o.g. Zweck die
                Erhebung und Verarbeitung der
                Daten erforderlich ist, können die entsprechenden Dienstleistungen
                in der Folge in diesem Fall nicht in Anspruch genommen werden.</p>
                <p style="margin-bottom: 0.11in; line-height: 108%"><br/></p>

                <font size="3" style="font-size: 12pt"><b>Zustimmung durch die
                betroffene Person:</b></font>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Zur Verwendung,
                Speicherung und Nutzung meiner o.g. persönlichen Daten, erteile ich
                meine Einwilligung i.S.v.
                Art. 6 Abs. 1 lit. a) DS-GVO, die ich jederzeit ohne Angabe von
                Gründen mit Wirkung für die
                Zukunft widerrufen kann. Hiermit erkläre ich, über meine Rechte
                belehrt worden zu sein.</p>
                <br/>
                <p style="font-size: 12pt"><b>Kontakt:</b></p>
                <ul>
                  <li><p style="margin-bottom: 0in; line-height: 108%"><b>Beschwerden,
                  Auskunftsanfragen und andere Anliegen sind an folgende Stelle zu
                  richten:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Anna Massfeller</i>
                  <br>Junior
                  Research Group of Hugo Storm “Data science in agricultural economics”
                  <br>Niebuhrstraße 1a, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #8ebf42">anna.massfeller@ilr.uni-bonn.de</a></p>
                  <br/></li>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständiger Datenschutzbeauftragter der Universität Bonn:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Dr. Jörg Hartmann</i>
                  <br>
                  Genscherallee 3, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:joerg.hartmann@uni-bonn.de" style="color: #8ebf42">joerg.hartmann@uni-bonn.de</a>
                  <br>
                  <a href="tel:+49228736758" style="color: #8ebf42">+ 49 (0)228 -73 -6758</a>
                  <br> 
                  <a href="https://www.datenschutz.uni-bonn.de/" target="https://www.datenschutz.uni-bonn.de" style="color: #8ebf42">https://www.datenschutz.uni-bonn.de</a></p>
                </li>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständige
                  Aufsichtsbehörde:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Landesbeauftragte
                  für Datenschutz und Informationsfreiheit Nordrhein-Westfalen</i>
                  <br>Postfach 20 04 44, 40102 Düsseldorf</p>
                  <br>
              </li>
              </ul>
                </div>
                </div>
                <h3>Datenschutzerklärung Akzeptieren:<input
                type="checkbox"
                true-value="yes"
                false-value="no"
                v-model="surveyData.consent"
                /></h3>
            </section> 
         <button @click.prevent="next({consent: 'consent'})">Weiter</button>
        </div>

        <div v-if="step === 2">
            <h1>Frage {{ pageNumber }}</h1>
            <div>
            <modal
             hideModal = true; helpText="Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung.">
            </modal>
            </div>
            <br>
              <section>
                <legend for="questionOne">
                  Betreiben Sie mechanische oder chemisch-mechanisch kombinierte Unkrautbekämpfung in Ihren Zuckerrüben?
                </legend>
                <br />
                <input
                  type="radio"
                  value="Ja"
                  v-model="surveyData.questionOne"
                />
                <label for="one">Ja</label>
                <br />
                <input 
                type="radio" 
                value="Nein" 
                v-model="surveyData.questionOne" 
                />
                <label for="one">Nein</label>
                <br />
            </section>
              
          <button @click.prevent="prev()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
           <br />
              
        </div>

    <div v-if="step === 3 && surveyData.questionOne ==='Nein'">
          <h1>Frage {{ pageNumber }}</h1>
          <modal 
          hideModal = true; helpText="Bitte geben Sie uns einige Hintergundinformationen zu Ihrer Entscheidung.">
          </modal>
          <br>
          <div>
            <legend for="questionTwoAlternative"> 
              a)  Warum nutzen Sie keine mechanische Unkrautbekämpfung? 
            </legend>
             <br>
              <div>
               <div v-for="(category, index) in categories" :key="index">
                    <input type="checkbox" v-model="surveyData.questionTwoAlternative.reason" :value="category"  />
                    <label>{{category}}</label>
                  </div>
                </div>
          </div>
            <br>
            <br>
          <div>
            <legend for="questionTwoAlternative"> 
              b) Wie bekämpfen Sie Ihr Unkraut stattdessen?
            </legend>
            <br>
             <input
              type="singleLine"
              v-model="surveyData.questionTwoAlternative.method"
              placeholder="Kommentare hier hinfügen"
              required
              />
            <br>
            <br>
          </div>
          <div>
          <legend for="questionTwoAlternative"> 
            c)  Können Sie sich vorstellen in Zukunft mechanische Unkrautbekämpfung einzusetzen?
          </legend>
           <br>
          <input
                type="radio"
                value="Ja"
                v-model="surveyData.questionTwoAlternative.future.radio"
              />
              <label for="one">Ja</label>
              <br />
              <input 
              type="radio" 
              value="Nein" 
              v-model="surveyData.questionTwoAlternative.future.radio" 
              />
              <label for="one">Nein</label>
              <br />
              .. weil: 
                <br>
                <input
                type="singleLine"
                v-model="surveyData.questionTwoAlternative.future.reason"
                placeholder="Kommentare hier hinfügen"
                required
                />
            <br>
        </div>
          <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
      </div>

    <div v-if="step === 3 && surveyData.questionOne ==='Ja'">
          <h1>Frage {{ pageNumber }}</h1>
          <modal 
          hideModal = true; helpText="Bitte geben Sie auch an, ob Sie die Technik bis heute nutzen oder mittlerweile nicht mehr nutzen. 
                    Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung">
          </modal>
          <br>
          <section>
            <legend for="questionTwo"> 
              Seit wann nutzen Sie die folgenden Techniken? 
            </legend>
              <br>
                <div style="width: 400px">   
                  <multiselect v-model="surveyData.questionTwo.technique" 
                              :multiple="true"
                              :options="options"
                              :close-on-select="true"
                              :clear-on-select="false"
                              placeholder="Auswahl"  
                              selectLabel= "zum Auswählen anklicken"
                              selectedLabel="Ausgewählt" 
                              deselect-label="zum Entfernen anklicken" 
                              :preserve-search="false"
                              :max-height="300"
                              :searchable="false"
                              >
                    </multiselect> 
                </div>
          </section>
          <br/>
          <section>
             <label style="font-size: 14px"  for="questionTwoAdditional">Andere Techniken:&nbsp;&nbsp;</label>
            <div style="display:flex; flex-direction: row; justify-content: left  ; align-items: center">
            <input id="questionTwoeAdditional"
                type="text"
                required
                v-model="surveyData.questionTwoAdditional"
                placeholder="andere Technicken hier hinfügen"
                pattern="[aA-Zz]">
            <button @click.prevent="surveyData.questionTwo.technique.push(surveyData.questionTwoAdditional)">
            Hinfügen
            </button>
            </div>
          </section>
          <br/>
          <table class="table table-success table-striped table-bordered" id="techniqueTable" 
          align="center" style="border:2px solid black; border-style: solid">
            <thead>
              <tr>
                <th scope="col">Gerät</th>
                <th scope="col">Seit</th>
                <th scope="col">Zusatzausstattung/ Investition/ Kommentare 
                  <i class="fa fa-question-circle" aria-hidden="true" 
                  data-toggle="tooltip" data-placement="bottom" 
                  title="Hat die Maschine eine besondere Ausstattung? Haben Sie das Gerät in der Vergangenheit durch ein neues ersetzt? Ist das Gerät autonom fahrend? Haben Sie vielleicht selbst etwas angebaut? Dann nutzen Sie bitte das Kommentarfeld."
                  style="font-size:22px;color:#DD0000;">
                  </i>
                </th>
                 <th scope="col">Wessen Maschine wird genutzt?</th>
              </tr>
            </thead>
            <tbody>
                <tr v-for="(method, index) in surveyData.questionTwo.technique" :key="index">
                  <td>{{method}}
                    <button style="width:23px; height:23px"  class="button close-icon" @click.prevent="deleteEntryTechnique(index)"></button>
                  </td>  
                  <td>          
                      <div style="display: flex">
                        <div style="position: relative">
                          <label>Jahr: </label>
                        </div>
                        <div style="position: relative">
                          <input style="height:20px; width: 50px"
                          type="text"
                          v-model="surveyData.questionTwo.timeframe[index]"
                          placeholder=""
                          required> 
                        </div>
                      </div> 
                  </td> 
                 <td>
                     <div style="display: flex">
                        <div style="position: relative">
                          <label>Mit Kamera seit: </label>
                        </div>
                        <div style="position: relative">
                          <input style="height:20px; width: 50px"
                          type="text"
                          v-model="surveyData.questionTwo.camera[index]"
                          placeholder="Jahr?"
                          required> 
                        </div>
                      </div>
                      <div style="display: flex">
                        <div style="position: relative">
                          <label>Mit GPS seit: </label>
                        </div>
                        <div style="position: relative">
                          <input style="height:20px; width: 50px"
                          type="text"
                          v-model="surveyData.questionTwo.gps[index]"
                          placeholder="Jahr?"
                          required> 
                        </div>
                      </div>
                      <div style="display: flex">
                        <div style="position: relative">
                          <label>Neuinvestition in: </label>
                        </div>
                        <div style="position: relative">
                          <input style="height:20px; width: 50px"
                          type="text"
                          v-model="surveyData.questionTwo.newInvest[index]"
                          placeholder="Jahr?"
                          required> 
                        </div>
                      </div>
                      <div>
                      <label for="one">Autonom fahrend</label>
                      <input
                      id="one"
                      type="checkbox"
                      true-value="yes"
                      false-value="no"
                      v-model="surveyData.questionTwo.autonom[index]"
                      />
                      </div>
                      <div style="display: flex">
                        <div style="position: relative">
                          <label>Kommentar: </label>
                        </div>
                        <div style="position: relative">
                          <input style="height:20px; width: 100px"
                          type="text"
                          v-model="surveyData.questionTwo.comment[index]"
                          placeholder="hier einfügen"
                          required>
                        </div>
                      </div>
                  </td>
                  <td>
                    <input
                      type="radio"
                      value="own"
                      v-model="surveyData.questionTwo.mashine[index]"
                      />
                      <label>Eigene Maschine</label>
                      <br />
                      <input 
                      type="radio" 
                      value="shared"
                      v-model="surveyData.questionTwo.mashine[index]" 
                      />
                      <label>Teile mit Nachbarn</label>
                      <br />
                      <input 
                      type="radio" 
                      value="maschinenring"
                      v-model="surveyData.questionTwo.mashine[index]" 
                      />
                      <label>Maschinenring</label>
                      <br />
                      <input 
                      type="radio" 
                      value="lohnunternehmer"
                      v-model="surveyData.questionTwo.mashine[index]" 
                      />
                      <label>Lohnunternehmer</label>
                      <br />
                      <div style="display: flex">
                        <div style="position: relative">
                          <label>Andere: </label>
                        </div>
                        <div style="position: relative">
                          <input style="height:20px; width: 100px"
                          type="text"
                          v-model="surveyData.questionTwo.other_machine[index]"
                          placeholder="hier einfügen"
                          required>
                        </div>
                      </div>
                </td>
              </tr>   
            </tbody>
          </table>
          <button @click.prevent="deleteRowTechnique()">Alle löschen</button>
          <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>

      
       <div v-if="step === 4">

            <h1>Frage {{ pageNumber }}</h1>
            <modal 
            hideModal = true; helpText="Hierbei sind nicht nur Zuckerrübenbauern gemeint. 
            Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung">
            </modal>
            <br>            
            <section>
              <legend for="questionThree">
                  Von wie vielen Landwirten/Betrieben wissen Sie, dass diese mechanische oder chemisch-mechanisch kombinierte 
                  Unkrautbekämpfung auf Ihren Feldern <b style="color: #DD0000">(nicht nur in Zuckerrüben!)</b> einsetzen?               
              </legend>
                <br />
                <input
                  type="radio"
                  value="0"
                  v-model="surveyData.questionThree"
                />
                <label for="one">0</label>
                <br />
                <input 
                type="radio" 
                value="1-5" 
                v-model="surveyData.questionThree" 
                />
                <label for="one">1-5</label>
                <br />
                <input 
                type="radio" 
                value="6-10" 
                v-model="surveyData.questionThree" 
                />
                <label for="one">6-10</label>
                <br />
                <input 
                type="radio" 
                value="mehr als 10" 
                v-model="surveyData.questionThree" 
                />
                <label for="one">mehr als 10</label>
                <br />
            </section>

              <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
              <button @click.prevent="next();" @click="pageNumber+=1; setColor()">Weiter</button>      
        </div>

      <div v-if="step === 5 || step === 6">
       <div v-if="step === 5 && skip_map == false">
          <h1>Frage {{ pageNumber }}</h1>
            <modal 
              hideModal = true; helpText=" Bitte markieren Sie die entsprechende Lage auf der Karte. 
              Sie können die Karte verschieben, indem Sie die linke Maustaste gedrückt halten. 
              Für unsere Auswertung ist eine möglichst präzise Angabe hilfreich.">
           </modal>
           <br>          
              <legend for="questionFour">
                Auf welchen Feldern haben Sie im letzten Wirtschaftsjahr Zuckerrüben angebaut? 
                Bitte klicken Sie die entsprechenden Felder an bzw. setzen Sie den Marker.
                <br>
                <br>
                Um Ihnen die Auswahl zu erleichtern haben wir die Felder umrandet jene gelb markiert, 
                auf denen im letzten Wirtschaftsjahr (2021) Zuckerrüben angebaut wurden. 
                Sie haben außerdem die Möglichkeit auch nicht umrandete Flächen mit Hilfe eines kleinen Traktor-Symbols zu markieren. 
                <br>
                <br>
                Die Daten stammen aus der frei zugänglichen Invekos-Datenbank. Wenn Sie keine Flächen anklicken möchten, 
                können Sie diese Frage auch überspringen und im nächsten Schritt Ihre Postleitzahl angeben.
              </legend>    
              <br/>
           
          <div v-if="surveyData.questionThree != '0'">
              <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
              <button @click.prevent="next()" @click="pageNumber+=1; setColor()">Weiter</button>
              <button @click.prevent="skip_map = true">Überspringen</button>
          </div>
        
          <div v-if="surveyData.questionThree == '0'">
              <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
              <button @click.prevent="step = 7" @click="pageNumber+=1">Weiter</button>
              <button @click.prevent="skip_map = true">Überspringen</button>
          </div>
      </div>

      <div v-if="step === 5 && skip_map == true">
          <h1>Frage {{ pageNumber }} Alternative</h1>
          <modal 
              hideModal = true; helpText="Hilfe?">
          </modal>
          <br>          
          <legend for="questionFourAlternative">
               <br/>
               Bitte geben Sie Ihre Postleitzahl an: 
                <br/>
              </legend>
              <div> 
                    <input 
                    id="zip"
                    name="zip"  
                    minlength="5" 
                    maxlength="5"  
                    size="5"                
                    inputmode="numeric"                 
                    type="text" 
                    required
                    v-model="surveyData.questionFourAlternative" 
                    >
                </div>
                <br/>
                <br/>
           <div v-if="surveyData.questionThree != '0'">
              <button @click.prevent="skip_map = false">Zurück</button>
              <button @click.prevent="next()" @click="pageNumber+=1; setColor()">Weiter</button>
          </div>
        
          <div v-if="surveyData.questionThree == '0'">
              <button @click.prevent="skip_map = false">Zurück</button>
              <button @click.prevent="step = 7" @click="pageNumber+=1">Weiter</button>
          </div>
      </div>

      <div v-if="step === 6  && skip_map2 == false">
          <h1>Frage {{ pageNumber }}</h1>
           <modal 
            hideModal = true; helpText="Bewegen Sie die Karte in dem Sie den linken Mauszeiger gedrückt halten.">
          </modal>
          <br>          
          <section>
            <legend for="questionFive">
              Auf welchen Feldern sehen Sie mechanische oder chemisch-mechanisch kombiniert Unkrautbekämpfung. <b style="color: #DD0000">Hierbei sind nicht nur Zuckerrübenfelder gemeint!</b> 
              <br>
              <br>
              Können Sie diese Felder auf der Karte anklicken?
              Wenn Sie nicht genau wissen, wo die Felder, können Sie diese Frage auch überspringen und im nächsten Schritt eine ungefähre Anzahl und Entfernung angeben.
              </legend>
          </section>
          <button @click.prevent="prev()" @click="pageNumber-=1; setColor()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
          <button @click.prevent="skip_map2 = true">Überspringen</button>   
      </div>
      <div v-if="step === 6 && skip_map2 == true">
      <h1>Frage {{ pageNumber }} Alternative</h1>
      <modal 
      hideModal = true; helpText="Teilen Sie uns Ihre Gedanken zu dieser Umfrage und zum Thema mechanische Unkrautbekämpfung mit.">
      </modal>
      <br>      
      <section>
        <legend for="questionFiveAlternative">
            Liegen die Felder von denen Sie wissen, dass dort  Unkraut mechanisch oder chemisch-mechanisch kombiniert Unkraut bekämpft wird, in Ihrer direkten Umgebung?        
        </legend>
            <br/>
            <div style="margin: 5px; padding: 5px; border: 4px solid black;">
              <label>
             <b>A)</b> Wie viele Felder kennen Sie, auf denen Unkraut mechanisch oder chemisch-mechanisch kombiniert wird?             
            </label>
              <br>
              <br>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.questionFiveAlternative.fields">
              <label class="form-check-label">0</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1-5" v-model="surveyData.questionFiveAlternative.fields">
              <label class="form-check-label">1-5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6-10" v-model="surveyData.questionFiveAlternative.fields">
              <label class="form-check-label">6-10</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="11-15" v-model="surveyData.questionFiveAlternative.fields">
              <label class="form-check-label">11-15</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="mehr als 15" v-model="surveyData.questionFiveAlternative.fields">
              <label class="form-check-label">mehr als 15</label>
          </div>              
        </div>              
      </section>
        
      <section>
        <div style="margin: 5px; padding: 5px; border: 4px solid black;">
        <label for="questionFiveAlternative">
        <b>B)</b> In welchem Umkreis liegen diese Felder?
        </label>
        <br>
        <br>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0-5 km" v-model="surveyData.questionFiveAlternative.distance">
              <label class="form-check-label">0-5 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6-10 km" v-model="surveyData.questionFiveAlternative.distance">
              <label class="form-check-label">6-10 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="11-15 km" v-model="surveyData.questionFiveAlternative.distance">
              <label class="form-check-label">11-15 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="16-20 km" v-model="surveyData.questionFiveAlternative.distance">
              <label class="form-check-label">16-20 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="21-30 km" v-model="surveyData.questionFiveAlternative.distance">
              <label class="form-check-label">21-30 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="mehr als 30 km" v-model="surveyData.questionFiveAlternative.distance">
              <label class="form-check-label">mehr als 30 km</label>
          </div>
        </div>
      </section>
        <button @click.prevent="skip_map2 = false">Zurück</button>
        <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
    </div>  
     <div style="border: 4px solid black; padding: 5px">
        <!-- Maps component embedding -->
        <keep-alive>
          <markermapbox v-bind:marker-color="currentColor" @map_clicked="setGeolocation"/>
        </keep-alive>
    </div>
  </div>
    
    <div v-if="step === 7">
        <h1>Frage {{ pageNumber }}</h1>
        <modal 
        hideModal = true; helpText="Diese Daten dienen zur Erfassung der Repräsentativität unserer Umfrage 
        und werden wie die gesamte Umfrage anonymisiert erfasst.">
        </modal>
        <br>        
        <section>
          <legend for="questionSix">
              Wie alt sind Sie?
          </legend>
          <br />
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="15-24" v-model="surveyData.questionSix">
              <label class="form-check-label">15-24</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="25-34" v-model="surveyData.questionSix">
              <label class="form-check-label">25-34</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="35–44" v-model="surveyData.questionSix">
              <label class="form-check-label">35–44</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="45-54" v-model="surveyData.questionSix">
              <label class="form-check-label">45-54</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="55-64" v-model="surveyData.questionSix">
              <label class="form-check-label">55-64</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="65 und mehr" v-model="surveyData.questionSix">
              <label class="form-check-label">65 und mehr</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="keine Angabe" v-model="surveyData.questionSix">
              <label class="form-check-label">keine Angabe</label>
          </div>
          <br />
        </section>

        <div v-if="surveyData.questionThree != '0'">
            <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
            <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>
      
        <div v-if="surveyData.questionThree == '0'">
          <button @click.prevent="step = 5" @click="pageNumber-=1">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>
    </div>



    <div v-if="step === 8">
        <h1>Frage {{ pageNumber }}</h1>
        <modal 
        hideModal = true; helpText="Diese Daten dienen zur Erfassung der Repräsentativität unserer Umfrage 
        und werden wie die gesamte Umfrage anonymisiert erfasst.">
        </modal>
        <br>        
        <section>
          <legend for="questionSeven">
              Wie groß ist Ihr Betrieb (in ha)?
          </legend>
          <br />
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="unter 5" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">unter 5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="5-10" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">5-10</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="10-20" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">10-20</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="20-50" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">20-50</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="50-100" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">50-100</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="100-200" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">100-200</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="200–500" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">200–500</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="500-1000" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">500-1000</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1000 und mehr" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">1000 und mehr</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="keine Angabe" v-model="surveyData.questionSeven">
              <label style="display:inline-block" class="form-check-label">keine Angabe</label>
          </div>
          <br />
        </section>
    <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
    <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
    </div>

    <div v-if="step === 9">
        <h1>Frage {{ pageNumber }}</h1>
        <modal 
        hideModal = true; helpText="Teilen Sie uns Ihre Gedanken
         zu dieser Umfrage und zum Thema mechanische Unkrautbekämpfung mit.">
        </modal>
        <br>        
        <section>
          <legend for="questionEight">
            Wie bewirtschaften Sie Ihren Betrieb?
          </legend>
          <br />
          <div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="konventionell" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label">konventionell</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="ökologisch" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label">ökologisch</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="teilweise ökologisch" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label">teilweise ökologisch</label>
          </div>
          </div>
          <br />
        </section>

        <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
        <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
    </div>

    <div v-if="step === 10">
        <h1>Frage {{ pageNumber }}</h1>
        <modal 
        hideModal = true; helpText="Teilen Sie uns Ihre Gedanken
         zu dieser Umfrage und zum Thema mechanische Unkrautbekämpfung mit.">
        </modal>
        <br>        
        <section>
          <legend for="questionNine">
            Haben Sie Fragen oder Kommentare? Hier ist Platz dafür:
          </legend>
          <br />
          <div class="form-group">
            <textarea class="form-control"
                      style="width: 500px"
                      v-model="surveyData.questionNine"
                      placeholder="Fragen oder Kommentare hier hinfügen"
                      required
                      id="questionNine"
                      rows="3">
            </textarea>
          </div>
          <br />
        </section>

        <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
        <button @click.prevent="next()">Weiter</button>
    </div>


    <div v-if="step === 11">
      <h1>Ende</h1>
      <div style="margin: 5px; padding: 5px; border: 4px solid black;">
      <section>
            <p>
            Vielen Dank, dass Sie sich die Zeit genommen haben, an der Umfrage teilzunehmen.
            </p>
            <p>
            Sie haben nun die Möglichkeit bei unserem Gewinnspiel mitzumachen.
            Unter je 100 Teilnehmern verlosen wir drei Gutscheine für Engelbert Strauss im Wert von 50 €.
            Dazu können Sie unten Ihre E-Mail-Adresse angeben. Diese wird getrennt von Ihren Angaben gespeichert und es kann keine Verbindung zu Ihren Antworten hergestellt werden.
            </p>
            <p>
            Wenn Sie möchten, senden wir Ihnen auch die zusammengefassten Ergebnisse der Studie zu.
            </p>
      </section>
      </div>
       <div style="margin: 5px; padding: 5px; border: 4px solid black;">
      <section>
        <p for="questionTen">
            Möchten Sie die zusammengefassten Ergebnisse der Studie per Mail erhalten?
        </p>
        <input
          type="radio"
          name="questionTen"
          id="questionTen"
          value="Ja"
          v-model="surveyData.questionTen"
        />
        <label>Ja</label>
        <br />
        <input 
        type="radio" 
        value="Nein" 
        v-model="surveyData.questionTen" 
        />
        <label>Nein</label>
        <br />
      </section>
      <br />

      <section>
        <p for="questionEleven">
            Möchten Sie an dem Gewinnspiel teilnehmen?
        </p>
          <input
            type="radio"
            name="questionEleven"
            id="questionEleven"
            value="Ja"
            v-model="surveyData.questionEleven"
          />
          <label for="one">Ja</label>
          <br />
          <input 
          type="radio" 
          value="Nein" 
          v-model="surveyData.questionEleven" 
          />
          <label for="one">Nein</label>
          <br />
          <br />
      </section> 
      </div>                     
        <div style="margin: 5px; padding: 5px; border: 4px solid black;" v-if="surveyData.questionTen=='Ja' || surveyData.questionEleven=='Ja'">  
            <p>
            Bitte geben Sie hier Ihren Namen und Ihre E-Mail-Adresse an. Diese Daten werden gesondert gespeichert und es besteht keine Verbindung zu Ihren Antworten in der Umfrage.
            </p>           
            <br />
            <div class="mb-3">
                <label for="farmerName" class="form-label"><b>Name:</b></label>
                <input v-model="surveyData.farmerName" class="form-control" id="farmerName" placeholder="Thomas Müller" required>
            </div>
            <div class="mb-3">
                <label for="farmerEmail" class="form-label"><b>E-mail Adresse:</b></label>
                <input v-model="surveyData.farmerEmail" type="email" class="form-control" aria-describedby="emailHelp" id="farmerEmail" placeholder="mueller@gmx.de" required>
                <small id="emailHelp" class="form-text text-muted">Wir werden Ihre E-Mail niemals an Dritte weitergeben.</small>
            </div>
        </div>
        <br>
      <div style="margin: 5px; padding: 5px; border: 4px solid black;">
      <section>
          Bei Fragen melden Sie sich bitte bei:
          <br />
          <br />
          <i>Anna Massfeller, Doktorandin am Institut für Lebensmittel- und Ressourcenökonomik, Universität Bonn
          <br />
          E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #8ebf42">anna.massfeller@ilr.uni-bonn.de</a>
          </i>
      </section>
      </div>
  <button @click.prevent="prev()">Zurück</button>
  <button @click.prevent="submit()">Abgeben</button>
  </div>

       <div v-if="step === 'done'">
          <h1>Fertig!</h1>
          <p>Thanks for filling out our survey! The following data just arrived at our backend:</p>
          <br>
          {{ backendResponse }}
          <br>
        </div>

        <div v-if="step === 'error'">
          <h1>Oh no!</h1>
          <p>Something happend. Sorry for the inconvenience!</p>
          <br>
          <button @click.prevent="step = 1">Restart</button>
        </div>

      <p v-if="errors && errors.length">
        <b>Bitte geben Sie die erforderlichen Angaben ein:</b>
      </p>
      <br /><br />Debug: {{surveyData}}

    </div>
    </template>

<script>

import markermapbox from '@/components/markermapbox.vue'
import modal from './modal.vue'
import heatmapbox from './heatmapbox.vue'
import multiselect from 'vue-multiselect'
import {
  gmapApi
} from "gmap-vue";

var PouchDB = require('pouchdb');
let pouchDb = PouchDB.default.defaults();
let db = new pouchDb('https://fruchtfolge.agp.uni-bonn.de/db/survey_anna/', {
  skip_setup: true
})
db.info().then(info => console.log(info));


export default {
  computed: {
    google: gmapApi
    },
    name: 'survey',
    components: {markermapbox, modal, heatmapbox, multiselect},   
  data () {
    return {
      step: 0,
      pageNumber: 1,
      isHidden: false,
      errors: [],
      zip: null,
      skip_map: false,
      skip_map2: false,
      zip_to_geo: {},
      selected: null,
      categories: ['Zu hohe Kosten', 'Geringe Zuverlässigkeit', 'Hohes Risiko', 'Technik nicht vorhanden', 'Zeitaufwand zu hoch', 'nicht möglich auf meinem Betrieb'],
      options: ['Striegel', 'Hackstriegel', 'Reihenstriegel', 'Rotorstriegel', 'Scharhacke', 'Trennhacke', 'Rollhacke', 'Fingerhacke', 'Kombination Hacke-Bandspritze', 'Häufelgerät', 'Hackbürste', 'Hackfräse'],
      heatmap_coords: [],
      chosen_technique: "choose",
      currentColor: '',
      surveyData: {
        _id: new Date().toISOString(),
        consent: null,
        questionOne: 'Ja',
        questionTwo: {
          technique: [],
          timeframe: [],
          camera: [],
          gps: [],
          newInvest: [],
          autonom: [],
          comment: [],
          mashine: [],
          other_machine: []
        },
        questionTwoAdditional: null,
        questionTwoAlternative: {
          reason: [],
          method: null,
          future: {
            radio: 'Ja',
            reason: null
          }
        },
        questionThree: [],
        questionFourAndFive: {farms: [], shapes: []}, //here the farmer + neighbor coordinates are saved
        questionFourAlternative: [],
        questionFiveAlternative: {
          distance: [],
          fields: []
        },
        questionSix: null,
        questionSeven: null,
        questionEight: null,
        questionNine: null,
        questionTen: null,
        questionEleven: null,
        farmerName: null,
        farmerEmail: null
      }
    }
  },
  methods: {

    //-- PouchDB methods

    setGeolocation: function(markers, plots) {
      for (var i = 0; i < markers.length; i++) {
        console.log("marker" + i + markers[i]["own"]);
      }
      this.surveyData.questionFourAndFive.farms = markers


      for (var j = 0; j < plots.features.length; j++) {
        console.log("Plot" + j + plots.features[j].geometry.coordinates)

      }
      this.surveyData.questionFourAndFive.shapes = plots

    },

    getGeolocation: function() {
      var heatmap_data = []
      db.allDocs({
        include_docs: true,
        descending: true
      }).then(function(result) {
        var jsonData = result.rows
        console.log(jsonData.length)
        for (var i = 0; i < jsonData.length; i++) {

          // *** insert the techniques ***
          
          var techniques = jsonData[i].doc.questionTwo.technique
          console.log("techniques", techniques)
          heatmap_data.push({
            technique: techniques,
            coords: []
          })

          // *** insert the plot coordinates ***

          var plot_entries = jsonData[i].doc.questionFourAndFive.shapes.features
          for (var j = 0; j < plot_entries.length; j++) {
            var plots = plot_entries[j].geometry.coordinates[0][0][0]
            var plots_coords = {'lng': plots[0], 'lat': plots[1]}
            console.log("plot", plots_coords)
            heatmap_data[i].coords.push(plots_coords)  
          }

          // *** insert the chosen farm coordinates ***

          var farm_entries = jsonData[i].doc.questionFourAndFive.farms
          for (var k = 0; k < farm_entries.length; k++) {

            if (farm_entries[k].own) {
            console.log("farm", farm_entries[k].own)
            heatmap_data[i].coords.push(farm_entries[k].own)  
          }
          }
        }
      console.log("whole_data", heatmap_data)
      }).catch(function(err) {
        console.log("error" + err)
      })
      return heatmap_data
    },
    deleteDB: function() {
      db.allDocs().then(function(result) {
        return Promise.all(result.rows.map(function(row) {
          return db.remove(row.id, row.value.rev);
        }));
      }).then(function() {
        console.log("done");
      }).catch(function(err) {
        console.log("error" + err);
      });
    },
    setColor: function(){
      if (this.step === 5) {
          this.currentColor = '#FF7F50'
          console.log(this.currentColor)
      }
      if (this.step === 6) {
          this.currentColor = "#1E90FF"}
          console.log(this.currentColor)
      },
    deleteEntryTechnique: function (index) {
      this.surveyData.questionTwo.technique.splice(index, 1)
      this.surveyData.questionTwo.timeframe.splice(index, 1)
      this.surveyData.questionTwo.camera.splice(index, 1)
      this.surveyData.questionTwo.gps.splice(index, 1)
      this.surveyData.questionTwo.newInvest.splice(index, 1)
      this.surveyData.questionTwo.autonom.splice(index, 1)
      this.surveyData.questionTwo.comment.splice(index, 1)
      this.surveyData.questionTwo.mashine.splice(index, 1)
      this.surveyData.questionTwo.other_machine.splice(index, 1)
    },
    deleteRowTechnique() {
      // delete row (index-0).
      this.surveyData.questionTwo.technique = []
      this.surveyData.questionTwo.timeframe = []
      this.surveyData.questionTwo.camera = []
      this.surveyData.questionTwo.gps = []
      this.surveyData.questionTwo.newInvest = []
      this.surveyData.questionTwo.autonom = []
      this.surveyData.questionTwo.comment = []
      this.surveyData.questionTwo.mashine = []
      this.surveyData.questionTwo.other_machine = []
    },
    prev() {
      this.step--
    },
    // those are question fields in the form, each of which is check if filled
    next(formFieldsToCheck) {
      if (formFieldsToCheck) {
        this.errors = []
        for (const field in formFieldsToCheck) {
          if (!this.surveyData[field] || !this.surveyData[field].length) {
            this.errors.push(
              `Please fill out the ${formFieldsToCheck[field]} question before continuing`
            )
          }
        }
      }
      if (!this.errors.length) {
        this.step++
      }
    },

    async postData(url = '', data = {}) {
      const response = await fetch(url, {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json'
        },
        redirect: 'follow',
        referrerPolicy: 'no-referrer',
        body: JSON.stringify(data)
      })
      return response.json()
    },
    async submit() {
      try {

        // send data to the backend, for testing use: "https://httpbin.org/post"

        this.backendResponse = await db.put(this.surveyData, function callback(err) {
          if (!err) {
            console.log('Successfully posted a farmer feedback!');
          }
        })

        db.changes({
          since: 'now',
          live: true
        }) // .on('change', this.showDocs());

        console.log(this.backendResponse)
        this.step = 'done'
        this.showDocs()
      } catch (e) {
        // ToDo: Handle errors
        console.error(e)
        this.step = 'error'
      }
    },
    async showDocs() {
      try {
        const {
          rows
        } = await db.allDocs({
          include_docs: true,
          descending: true
        })
        console.log(rows)
        //console.log("total rows " + rows.total_rows);
      } catch (e) {
        console.error(e)
      }
    }
  },
  // calculates the heatmap on page load
  beforeMount() {
    this.heatmap_coords = this.getGeolocation()
  }
}
</script>   
<style scoped>

#techniqueTable {
  font-size: 1.0vw;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(255, 255, 255);
  border-collapse: collapse;
  width: 100%;
}

#techniqueTable td,
#techniqueTable th {
  border: 3px solid rgb(43, 70, 77);
  padding: 8px;
}

#techniqueTable tr:nth-child(even) {
  background-color: #48696e;
}

#techniqueTable tr:nth-child(odd) {
  background-color: #48696e;
}

#techniqueTable tr:hover {
  background-color: rgb(85, 112, 128);
}

#techniqueTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #20585f;
  color: white;
}

table,
th,
td {
  border: 2px solid black;
}


button {
  color: #484b49;
  margin: 10px;
  border-radius: 5px;
  background-color: white;
  border: 1px solid #999;
  font-size: 1.05em;
  padding-right: 10px;
  padding-left: 10px;
  padding-top: 5px;
  padding-bottom: 5px;
  width: 120px;
  height: 45px;
  font-weight: bold;
}

button:hover {
background-color: #f0ebde;
}

h1 {
  text-align: center;
  display: block;
  font-size: 2em;
  margin-top: 0.67em;
  margin-bottom: 0.67em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}

legend {
  font-weight: normal;
  text-align: justify; 
  word-wrap: break-word;
  text-justify: inter-word;
  text-justify: distribute;
  text-align-last: left;
  font-size:18px; 
  word-spacing:3px;
  color: #dbdbdb;
}
@media only screen and (max-width: 800px) {
h1 {
  text-align: center;
  display: block;
  font-size: 3.4vw; 
  margin-top: 0.67em;
  margin-bottom: 0.67em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}

legend {
  font-weight: normal;
  text-align: justify;
  word-wrap: break-word;
  text-justify: inter-word;
  text-justify: distribute;
  text-align-last: left;
  font-size: 2.3vw; 
  word-spacing:3px;
  color: #dbdbdb;
}
button {
  width: 22%;
  height: auto;
  font-size: 2.5vw; 
  font-weight: bold;
}
}

.crop {
  display: flex;
  width: 50px;
  margin-right: 25px;
  font-size: 14px;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.bubble {
  width: 60px;
  height: 60px;
  background: grey;
  border-radius: 50%;
}


.multiselect {
  box-sizing: content-box;
  display: block;
  position: relative;
  width: 100%;
  min-height: 40px;
  text-align: left;
  color: #35495E;
}

.multiselect__tags {
  min-height: 40px;
  display: block;
  padding: 8px 40px 0 8px;
  border-radius: 5px;
  border: 1px solid #E8E8E8;
  background: rgb(46, 65, 88);
}

.multiselect__tag {
  position: relative;
  display: inline-block;
  padding: 4px 26px 4px 10px;
  border-radius: 5px;
  margin-right: 10px;
  color: #fff;
  line-height: 1;
  background: #5b6661;
  margin-bottom: 5px;
  white-space: nowrap;
  overflow: hidden;
  max-width: 100%;
  text-overflow: ellipsis;
}

.multiselect__tag-icon:after {
  content: "×";
  color: #216dcf;
  font-size: 14px;
}


.multiselect__content-wrapper {
  position: absolute;
  display: block;
  background: rgb(186, 185, 194);
  width: 100%;
  max-height: 240px;
  overflow: auto;
  border: 1px solid #E8E8E8;
  border-top: none;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  z-index: 50;
  -webkit-overflow-scrolling: touch;
}

.multiselect__option--highlight {
  background: #5c615f;
  outline: none;
  color: white;
}

.multiselect__option--highlight:after {
  content: attr(data-select);
  background: #02113a;
  color: rgb(61, 66, 133);
}

.multiselect__option--selected {
  background: #F3F3F3;
  color: #35495E;
  font-weight: bold;
}

.multiselect__option--selected:after {
  content: attr(data-selected);
  color: silver;
}

.multiselect__option--selected.multiselect__option--highlight {
  background: #6a79ff;
  color: rgb(7, 15, 54);
}

.multiselect__option--selected.multiselect__option--highlight:after {
  background: #4d77ad;
  content: attr(data-deselect);
  color: rgb(49, 139, 190);
}

.multiselect__placeholder {
  display: inline-block !important;
  margin-bottom: 0px !important;
  padding-top: 0px !important;
}

.multiselect.invalid .multiselect__tags {
  border: 1px solid #f86c6b !important;
}

.multiselect__option--highlight {
  background: #405568 !important;
}

.multiselect__option--highlight:after {
  background: #233647 !important;
}

.multiselect__tags {
  padding: 5px !important;
  min-height: 10px;
}

.multiselect__placeholder {
  margin-left: 10px;
  margin-top: 2px;
}

.multiselect__tag {
  background: #f0f0f0 !important;
  border: 1px solid rgba(60, 60, 60, 0.26) !important;
  color: black !important;
  margin-bottom: 0px !important;
  margin-right: 5px !important;
}

.multiselect__tag-icon:after {
  color: rgba(60, 60, 60, 0.5) !important;
}

.multiselect__tag-icon:focus,
.multiselect__tag-icon:hover {
  background: #f0f0f0 !important;
}

.multiselect__tag-icon:focus:after,
.multiselect__tag-icon:hover:after {
  color: red !important;
}

.bubble-wrapper {
  padding: 15px 0px 15px 15px;
  width: fit-content;
  display: flex;
  flex-wrap: nowrap;
}

* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 300px;
  /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.close-icon {
  box-sizing: border-box;
  width: 20px;
  height: 20px;
  border-width: 3px;
  border-style: solid;
  border-color: red;
  background: -webkit-linear-gradient(-45deg, transparent 0%, transparent 46%, white 46%, white 56%, transparent 56%, transparent 100%), -webkit-linear-gradient(45deg, transparent 0%, transparent 46%, white 46%, white 56%, transparent 56%, transparent 100%);
  background-color: rgb(173, 132, 132);
  box-shadow: 0px 0px 5px 2px rgba(5, 5, 5, 0.5);
  transition: all 0.3s ease;
}
</style>
