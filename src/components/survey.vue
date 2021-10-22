<template>
    <div>
    <div v-if="step === 0" class = heatMap>
      <button @click.prevent="getGeolocation()">calculate heatmap</button>
      <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
      <section>
            <legend> 
              Bitte wählen sie eine mechanische Unkrautbekämpfungmethode?
            </legend>
            <select class = "dropdown-menu-general" style="width: 15em; border: 2px black solid"
              v-model="chosen_technique">
              <option value="alle Techniken">alle Techniken</option>
              <option value="Striegel">Striegel</option>
              <option value="Scharhacke">Scharhacke</option>
              <option value="Hackbürste">Hackbürste</option>
              <option value="Trennhacke">Trennhacke</option>
              <option value="Hackfräse">Hackfräse</option>
              <option value="Rollhacke">Rollhacke</option>
              <option value="Hackstriegel">Hackstriegel</option>
              <option value="Fingerhacke">Fingerhacke</option>
              <option value="Häufelgerät">Häufelgerät</option>
              <option value="Reihenstriegel">Reihenstriegel</option>
              <option value="Rotorstriegel">Rotorstriegel</option>
            </select>
          </section>
      <div>
        <heatmap 
            v-bind:heatmap-data=heatmap_coords :selected-technique=chosen_technique>
        </heatmap>
      </div>
    </div>
    <div v-if="step === 1" class = firstPage>
          <h1>Willkommen zu unserer Umfrage für mechanische Unkrautbekämpfung in Zuckerrüben!</h1>
            <section>
                <legend for="consent">
                    <p>
                    In dieser Umfrage möchten wir herausfinden inwiefern das soziale Netzwerk einen Einfluss auf eigene Entscheidungen hat, insbesondere auf die Nutzung von mechanischer Unkrautbekämpfung. Dazu stellen wir Ihnen im Folgenden einige Fragen anhand einer interaktiven Karte.
                    </p>
                    <p>
                    Die Umfrage wird ca. 10 - 12 Minuten in Anspruch nehmen. Alle Ergebnisse werden anonymisiert analysiert. Wenn Sie möchten, senden wir Ihnen die zusammengefassten Ergebnisse der Studie zu. Dazu können Sie im Anschluss an die Studie Ihre persönlichen Daten angeben.
                    </p>
                    <p>
                    Bei Fragen wenden Sie sich bitte an:
                    <br/>
                    <br/>
                    Anna Massfeller
                    <br>
                    Doktorandin bei PhenoRob, Institut für Lebensmittel- und Ressourcenöknomik, Universität Bonn
                    <br />
                    E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de">anna.massfeller@ilr.uni-bonn.de</a> 
                    <p>
                    Die in der Umfrage gewählte männliche Form bezieht sich immer zugleich auf weibliche, diverse und männliche Personen.
                    Vielen Dank, dass Sie sich die Zeit nehmen, an der Umfrage teilzunehmen.
                    Unter allen Teilnehmern werden drei Gutscheine im Wert von 50 € für Engelbert Strauss verlost.
                    </p>
                    <p>
                    Um die Umfrage zu öffnen, akzeptieren Sie bitten unsere Datensicherheitserklärung. Danke!
                    </p>
                  </legend>
                    <button v-on:click="isHidden = !isHidden" class="link">Datensicherheitserklärung anzeigen</button>
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
                  <p style="margin-bottom: 0in; line-height: 108%">Anna Massfeller
                  <br>Junior
                  Research Group of Hugo Storm “Data science in agricultural economics”
                  <br>Niebuhrstraße 1a, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de">anna.massfeller@ilr.uni-bonn.de</a></p>
                  <br/></li>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständiger Datenschutzbeauftragter der Universität Bonn:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%">Dr. Jörg Hartmann
                  <br>
                  Genscherallee 3, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:joerg.hartmann@uni-bonn.de">joerg.hartmann@uni-bonn.de</a>
                  <br>
                  <a href="tel:+49228736758">+ 49 (0)228 -73 -6758</a>
                  <br> 
                  <a href="https://www.datenschutz.uni-bonn.de/" target="https://www.datenschutz.uni-bonn.de">https://www.datenschutz.uni-bonn.de</a></p>
                </li>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständige
                  Aufsichtsbehörde:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%">Landesbeauftragte
                  für Datenschutz und Informationsfreiheit Nordrhein-Westfalen
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
              <modal 
              helpText="Bitte beantworten Sie die Frage"
              >
              </modal>
              <section>
                <legend for="questionOne">
                  Betreiben Sie mechanische Unkrautbekämpfung in Ihren Zuckerrüben?
                </legend>
                <br />
                <input
                  type="radio"
                  name="questionOne"
                  id="questionOne"
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
                <br />
              </section>
          <button @click.prevent="prev()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>

     <div v-show="step === 3 || step === 7">
       <div v-if="step === 3">
          <modal 
              helpText="Bitte markieren Sie die entsprechende Lage auf der Karte. 
              Sie können die Karte verschieben, indem Sie die rechte Maustaste gedrückt halten. 
              Genauigkeit verändern durch Kreis größer-kleiner - für uns gut möglichst genau">
          </modal>
          <h1>Frage {{ pageNumber }}</h1>
            <section>
              <legend for="questionTwo">
                Auf welchen Feldern haben Sie im letzten Wirtschaftsjahr Zuckerrüben angebaut?
                <br/>
                <br/>
              </legend>
            </section>
                 <div id="app" class="bubble-wrapper">
                    <button
                      class="bubble" @click="currentColor ='red'; setMode(true)"
                      :style="{ backgroundColor: 'red', border: '3px solid black'}"
                    />
                </div>
                <!-- <span style="color:white;margin-left: 1%;margin-top:0%;vertical-align: text-top;text-align:right">{{"Eigene Felder"}}</span> -->
           <div v-if="surveyData.questionOne == 'Ja'">
              <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
            <button @click.prevent="next({questionOne: 'questionOne'})" @click="pageNumber+=1">Weiter</button>
          </div>        
          <div v-if="surveyData.questionOne == 'Nein'">
              <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
              <button @click.prevent="step = 5" @click="pageNumber+=1">Weiter</button>
          </div>
      </div>

      <div v-if="step === 7">
           <modal 
            helpText="Markieren Sie die Felder in der entsprechenden Farbe. 
            Wählen Sie die Farbe aus der Legende unter der Karte durch anklicken aus. 
            Bewegen Sie die Karte in dem Sie den rechten Mauszeiger gedrückt halten.">
            </modal>
          <h1>Frage {{ pageNumber }}</h1>
          <section>
            <legend for="questionSix">
              Bitte markieren Sie mind.1 Feld (gerne auch mehr) der oben genannten Landwirte in der jeweiligen Farbe. 
              Wenn Sie nicht wissen, wo die Felder der Landwirte liegen, können Sie diese Frage auch überspringen.
            </legend>
          </section>
             <div id="app" class="bubble-wrapper">
                  <div v-for="(landwirt, index) in surveyData.questionFive.landwirte" :key="index" class="crop">
                    <button
                      class="bubble" @click="setColor(index); setMode(true)"
                      :style="{ backgroundColor: landwirt.color, border: '3px solid black'}"
                    />
                    <span style="color:white; align-items:center">{{ landwirt.name }}</span>
                  </div>
                </div>
          <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
      </div>
        <div>
          <!-- Maps component embedding -->
              <keep-alive>
                <gmaps ref="gmaps" :circleColor = currentColor @map_clicked="setGeolocation"/>
             </keep-alive>
        </div>
      </div>

       <div v-if="step === 4">
          <modal 
          helpText="Bitte geben Sie auch an, ob Sie die Technik bis heute nutzen oder mittlerweile nicht mehr nutzen.">
          </modal>
          <h1>Frage {{ pageNumber }}</h1>
          <section>
            <legend for="questionThree"> 
              Wann haben Sie die folgenden Techniken zum ersten Mal genutzt? 
              Bitte geben Sie auch an, ob Sie die Technik bis heute nutzen oder mittlerweile nicht mehr nutzen.
            </legend>
            <select class = "dropdown-menu-general" style="width: 15em"
              id="questionThree"
              name="questionThree"
              v-model="surveyData.questionThree.technique" multiple>
              <option value="Striegel">Striegel</option>
              <option value="Scharhacke">Scharhacke</option>
              <option value="Hackbürste">Hackbürste</option>
              <option value="Trennhacke">Trennhacke</option>
              <option value="Hackfräse">Hackfräse</option>
              <option value="Rollhacke">Rollhacke</option>
              <option value="Hackstriegel">Hackstriegel</option>
              <option value="Fingerhacke">Fingerhacke</option>
              <option value="Häufelgerät">Häufelgerät</option>
              <option value="Reihenstriegel">Reihenstriegel</option>
              <option value="Rotorstriegel">Rotorstriegel</option>
            </select>
          </section>

          <section>
            <legend for="questionThreeAdditional">
              Andere Techniken:
            </legend>
            <input
              id="questionThreeAdditional"
              name="questionThreeAdditional"
              type="questionThreeAdditional"
              v-model="surveyData.questionThreeAdditional"
              placeholder="andere Technicken hier hinfügen"
            />
            <button @click.prevent="surveyData.questionThree.technique.push(surveyData.questionThreeAdditional)">
                Hinfügen
              </button>
          </section>

          <table class="table table-success table-striped table-bordered" id="techniqueTable" 
          align="center" style="border:2px solid black; border-style: solid">
            <thead>
              <tr>
                <th scope="col">Technik</th>
                <th scope="col">Zeitraum (1900 – heute)</th>
                <th scope="col">Zusätzliche Ausstattung/ Neuinvestition/ Kommentar
                  <i class="fa fa-question-circle" aria-hidden="true" 
                  data-toggle="tooltip" data-placement="bottom" 
                  title="Hat die Maschine eine besondere Ausstattung? Haben Sie im Laufe der Zeit die Maschine durch eine neuere ersetzt? Wenn ja, wann?"
                  style="font-size:22px;color:red;">
                  </i>
                </th>
              </tr>
            </thead>
            <tbody>
                <tr v-for="(method, index) in surveyData.questionThree.technique" :key="index">
                  <td>{{method}}<button @click.prevent="deleteEntryTechnique(index)">X</button></td>  
                  <td>
                    
                    <vue-range-slider 
                    v-model="surveyData.questionThree.timeframe[index]"
                    :bg-style="bgStyle" 
                    :tooltip-style="tooltipStyle" 
                    :enable-cross="enableCross"
                    :process-style="processStyle"
                    :step=5 
                    :min="min"
                    :max="max">
                  </vue-range-slider>
                  
                  </td> 
                  <td>
                      Mit Kamera seit:<input
                      id="camera"
                      name="camera"
                      type="singleLine"
                      v-model="surveyData.questionThree.camera[index]"
                      placeholder="Jahr?"
                      />
                      Mit GPS seit:<input
                      id="gps"
                      name="gps"
                      type="singleLine"
                      v-model="surveyData.questionThree.gps[index]"
                      placeholder="Jahr?"
                      />
                      Neuinvestition in Jahr:<input
                      id="newInvest"
                      name="newInvest"
                      type="singleLine"
                      v-model="surveyData.questionThree.newInvest[index]"
                      placeholder="Jahr?"
                      />
                      Kommentar (Freitext):<input
                      id="comment"
                      name="comment"
                      type="singleLine"
                      v-model="surveyData.questionThree.comment[index]"
                      placeholder="Kommentare hier hinfügen"
                      />
                  </td>
              </tr>   
            </tbody>
          </table>
          <button @click.prevent="deleteRowTechnique()">Löschen</button>
          <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>


        <div v-if="step === 5">
            <modal 
            helpText="Hierbei sind nicht nur Zuckerrübenbauern gemeint.">
            </modal>
            <h1>Frage {{ pageNumber }}</h1>
            <section>
              <legend for="questionFour">
                Gibt es Landwirte in Ihrer Umgebung, die Unkraut mechanisch bekämpfen (nicht nur ZR)?
              </legend>
                <br />
                <input
                  type="radio"
                  name="questionFour"
                  id="questionFour"
                  value="Ja"
                  v-model="surveyData.questionFour"
                />
                <label for="one">Ja</label>
                <br />
                <input 
                type="radio" 
                value="Nein" 
                v-model="surveyData.questionFour" 
                />
                <label for="one">Nein</label>
                <br />
                <br />
            </section>

          <div v-if="surveyData.questionFour == 'Ja'">
              <button v-if="surveyData.questionOne == 'Ja'" @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
              <button v-else @click.prevent="step = 3" @click="pageNumber-=1">Zurück</button>
            <button @click.prevent="next({questionFour: 'questionFour'})" @click="pageNumber+=1">Weiter</button>
          </div>
        
          <div v-if="surveyData.questionFour == 'Nein'">
              <button v-if="surveyData.questionOne == 'Ja'" @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
              <button v-else @click.prevent="step = 3" @click="pageNumber-=1">Zurück</button>
            <button @click.prevent="step = 8" @click="pageNumber+=1">Weiter</button>
          </div>
        </div>




        <div v-if="step === 6">
            <modal
            helpText="Legen Sie für jeden Landwirt, der mechanische Unkrautbekämpfung durchführt, eine Zeile an. Wählen Sie aus dem Drop-down Menu aus, 
            ob der jeweilige Landwirt die entsprechende Technik nutzt und ob er oder Sie damit zuerst angefangen haben.">
            </modal>
            <h1>Frage {{ pageNumber }}</h1>
            <section>
              <legend for="questionFive">
                Bitte geben Sie an, welche Art von mechanischer Unkrautbekämpfung der/die Landwirte durchführen und ob Sie oder der andere Landwirt diese Technik zuerst genutzt haben.
              </legend>
                  <select class = "dropdown-menu-general"
                    id="questionFive"
                    name="questionFive"
                    v-model="surveyData.questionFive.landwirte" multiple>
                    <option v-for="(farmer, index) in landwirte" v-bind:key="index" :value="{name: farmer.name, color: farmer.color}">{{farmer.name}}</option>
                  </select>
            </section>
      
                <table align="center" style="border:1px solid black; border-style: solid">
                  <thead>
                    <tr>
                      <th scope="col">Landwirt</th>
                      <!-- <th scope="col">Technik</th> -->
                      <th scope="col">Vorauflauf
                        <i class="fa fa-question-circle" aria-hidden="true" 
                        data-toggle="tooltip" data-placement="bottom" 
                        title="Hint 1"
                        style="font-size:15px;color:red;">
                        </i>
                      </th>
                      <th scope="col">Nachauflauf
                        <i class="fa fa-question-circle" aria-hidden="true" 
                        data-toggle="tooltip" data-placement="bottom" 
                        title="Hint 2"
                        style="font-size:15px;color:red;">
                        </i>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                      <tr v-for="(landwirt, index) in surveyData.questionFive.landwirte" :key="index">
                        <td class="bubble-wrapper" :style="{backgroundColor: landwirt.color}">{{landwirt.name}}<button @click.prevent="deleteEntryLandwirt(index)">X</button></td>  
                        <!-- <td>
                            <select class = "dropdown-menu"
                            id="questionFiveTechnik"
                            name="questionFiveTechnik"
                            v-model="surveyData.questionFive.technique[index]">
                            <option value="Striegel">Striegel</option>
                            <option value="Scharhacke">Scharhacke</option>
                            <option value="Hackbürste">Hackbürste</option>
                            <option value="Trennhacke">Trennhacke</option>
                            <option value="Hackfräse">Hackfräse</option>
                            <option value="Rollhacke">Rollhacke</option>
                            <option value="Hackstriegel">Hackstriegel</option>
                            <option value="Fingerhacke">Fingerhacke</option>
                            <option value="Häufelgerät">Häufelgerät</option>
                            <option value="Reihenstriegel">Reihenstriegel</option>
                            <option value="Rotorstriegel">Rotorstriegel</option>
                          </select>                        
                        </td> -->
                        <td> 
                            <input
                            type="radio"
                            name="questionFiveVorauflaufRadio"
                            id="questionFiveVorauflaufRadio"
                            value="Nutzt nicht"
                            v-model="surveyData.questionFive.vorauflauf[index]"
                            />
                            <label for="one">Nutzt nicht</label>
                            <br />
                            <input 
                            type="radio" 
                            value="Er erst" 
                            v-model="surveyData.questionFive.vorauflauf[index]" 
                            />
                            <label for="one">Er erst</label>
                            <br />
                            <input 
                            type="radio" 
                            value="Ich erst" 
                            v-model="surveyData.questionFive.vorauflauf[index]" 
                            />
                            <label for="one">Ich erst</label>
                            <br />
                            <input 
                            type="radio" 
                            value="Ich weiß nicht" 
                            v-model="surveyData.questionFive.vorauflauf[index]" 
                            />
                            <label for="one">Ich weiß nicht</label>                      
                        </td> 
                        <td>
                            <input
                            type="radio"
                            name="questionFiveNachauflaufRadio"
                            id="questionFiveNachauflaufRadio"
                            value="Nutzt nicht"
                            v-model="surveyData.questionFive.nachauflauf[index]"
                            />
                            <label for="one">Nutzt nicht</label>
                            <br />
                            <input 
                            type="radio" 
                            value="Er erst" 
                            v-model="surveyData.questionFive.nachauflauf[index]" 
                            />
                            <label for="one">Er erst</label>
                            <br />
                            <input 
                            type="radio" 
                            value="Ich erst" 
                            v-model="surveyData.questionFive.nachauflauf[index]" 
                            />
                            <label for="one">Ich erst</label>
                            <br />
                            <input 
                            type="radio" 
                            value="Ich weiß nicht" 
                            v-model="surveyData.questionFive.nachauflauf[index]" 
                            />
                            <label for="one">Ich weiß nicht</label>
                        </td>
                    </tr>   
                  </tbody>
                </table>
                <button @click.prevent="deleteRowLandwirt()">Löschen</button>
                <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
                <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
  
      </div>


    <div v-if="step === 8">
        <modal 
        helpText="Diese Daten dienen zur Erfassung der Repräsentativität unserer Umfrage 
        und werden wie die gesamte Umfrage anonymisiert erfasst.">
        </modal>
        <h1>Frage {{ pageNumber }}</h1>
        <section>
          <legend for="questionSeven">
              Wie alt sind Sie?
          </legend>
          <br />
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionSevenRadio1" value="15-24" v-model="surveyData.questionSeven">
              <label class="form-check-label" for="questionSevenRadio1">15-24</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionSevenRadio2" value="25-34" v-model="surveyData.questionSeven">
              <label class="form-check-label" for="questionSevenRadio2">25-34</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionSevenRadio3" value="35–44" v-model="surveyData.questionSeven">
              <label class="form-check-label" for="questionSevenRadio3">35–44</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionSevenRadio4" value="45-54" v-model="surveyData.questionSeven">
              <label class="form-check-label" for="questionSevenRadio4">45-54</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionSevenRadio5" value="55-64" v-model="surveyData.questionSeven">
              <label class="form-check-label" for="questionSevenRadio5">55-64</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionSevenRadio6" value="65 und mehr" v-model="surveyData.questionSeven">
              <label class="form-check-label" for="questionSevenRadio6">65 und mehr</label>
          </div>
          <br />
        </section>

        <div v-if="surveyData.questionFour == 'Ja'">
            <button @click.prevent="step = 7" @click="pageNumber-=1">Zurück</button>
            <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>
      
        <div v-if="surveyData.questionFour == 'Nein'">
            <button @click.prevent="step = 5" @click="pageNumber-=1">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
        </div>
    </div>



    <div v-if="step === 9">
        <modal 
        helpText="Diese Daten dienen zur Erfassung der Repräsentativität unserer Umfrage 
        und werden wie die gesamte Umfrage anonymisiert erfasst.">
        </modal>
        <h1>Frage {{ pageNumber }}</h1>
        <section>
          <legend for="questionEight">
              Wie groß ist Ihr Betrieb (in ha)?
          </legend>
          <br />
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio1" value="unter 5" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio1">unter 5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio2" value="5-10" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio2">5-10</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio3" value="10-20" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio3">10-20</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio4" value="20-50" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio4">20-50</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio5" value="50-100" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio5">50-100</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio6" value="100-200" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio6">100-200</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio7" value="200–500" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio7">200–500</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio8" value="500-1000" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio8">500-1000</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" 
              id="questionEightRadio9" value="1000 und mehr" v-model="surveyData.questionEight">
              <label style="display:inline-block" class="form-check-label" for="questionEightRadio9">1000 und mehr</label>
          </div>
          <br />
        </section>
    <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
    <button @click.prevent="next()" @click="pageNumber+=1">Weiter</button>
    </div>


    <div v-if="step === 10">
        <modal 
        helpText="Teilen Sie uns Ihre Gedanken
         zu dieser Umfrage und zum Thema mechanische Unkrautbekämpfung mit.">
        </modal>
        <h1>Frage {{ pageNumber }}</h1>
        <section>
          <legend for="questionNine">
            Haben Sie Fragen oder Kommentare? Hier ist Platz dafür:
          </legend>
          <br />
          <input
            id="questionNine"
            name="questionNine"
            type="singleLine"
            v-model="surveyData.questionNine"
            placeholder="Fragen oder Kommentare hier hinfügen"
            />
          <br />
          <br />
        </section>

        <button @click.prevent="prev()" @click="pageNumber-=1">Zurück</button>
        <button @click.prevent="next()">Weiter</button>
    </div>


    <div v-if="step === 11">
      <h1>Ende</h1>
      <section>
        <legend>
            <p>
            Vielen Dank, dass Sie sich die Zeit genommen haben, an der Umfrage teilzunehmen.
            </p>
            <p>
            Sie haben nun die Möglichkeit bei unserem Gewinnspiel mitzumachen.
            Unter je 100 Teilnehmern verlosen wir drei Gutscheine für Engelbert Strauss im Wert von 50 €.
            Dazu können Sie auf der folgenden Seite Ihre eMail-Adresse angeben. Diese wird getrennt von Ihren Angaben gespeichert und es kann keine Verbindung zu Ihren Antworten hergestellt werden.
            </p>
            <p>
            Wenn Sie möchten, senden wir Ihnen auch die zusammengefassten Ergebnisse der Studie zu.
            </p>
        </legend>
      </section>

      <section>
        <legend for="questionTen">
            Möchten Sie die zusammengefassten Ergebnisse der Studie per Mail erhalten?
        </legend>
        <input
          type="radio"
          name="questionTen"
          id="questionTen"
          value="Ja"
          v-model="surveyData.questionTen"
        />
        <label for="one">Ja</label>
        <br />
        <input 
        type="radio" 
        value="Nein" 
        v-model="surveyData.questionTen" 
        />
        <label for="one">Nein</label>
        <br />
      </section>
      <br />

      <section>
        <legend for="questionEleven">
            Möchten Sie an dem Gewinnspiel teilnehmen?
        </legend>
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
        <div v-if="surveyData.questionTen=='Ja' || surveyData.questionEleven=='Ja'">  
            <legend>
            Bitte geben Sie hier Ihren Namen und Ihre eMail-Adresse an. Diese Daten werden gesondert gespeichert und es besteht keine Verbindung zu Ihren Antworten in der Umfrage.
            </legend>           
            <br />
            <div class="mb-3">
                <label for="farmerName" class="form-label"><b>Name:</b></label>
                <input v-model="surveyData.farmerName" class="form-control" id="farmerName" placeholder="Thomas Müller">
            </div>
            <div class="mb-3">
                <label for="farmerEmail" class="form-label"><b>eMail-Adresse:</b></label>
                <input v-model="surveyData.farmerEmail" type="email" class="form-control" aria-describedby="emailHelp" id="farmerEmail" placeholder="name@example.com">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
        </div>
      <section>
        <legend>
          <p>
          Bei Fragen melden Sie sich bitte bei:
          <br />
          <br />
          <i><b>Anna Massfeller, Doktorandin bei PhenoRob 
          <br />
          Institut für Lebensmittel- und Ressourcenöknomik, Universität Bonn
          <br />
          E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de">anna.massfeller@ilr.uni-bonn.de</a>
          </b></i>
          </p>
        </legend>
      </section>
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
        <b>Please correct the following error(s):</b>
      </p>
      <br /><br />Debug: {{surveyData}}

    </div>
    </template>

<script>

import VueRangeSlider from 'vue-range-component'
import 'vue-range-component/dist/vue-range-slider.css'
import gmaps from '@/components/gmaps.vue'
import modal from './modal.vue'
import heatmap from './heatmap.vue'

var PouchDB = require('pouchdb');
let pouchDb = PouchDB.default.defaults();
let db = new pouchDb('https://fruchtfolge.agp.uni-bonn.de/db/survey_anna/', { skip_setup: true })
db.info().then(info => console.log(info));


export default {
    name: 'survey',
    components: {gmaps, modal, VueRangeSlider, heatmap},
    watch: {
    surveyData: {
      deep: true,
      handler (prop) {
        if (prop.questionThree.technique) {
          // for each technology selected
          prop.questionThree.technique.forEach((name, i) => {
            // check if the timeframe and comment arrays
            // have a non-null value. If so -> replace with default
            if (!this.surveyData.questionThree.timeframe[i]) {
              this.surveyData.questionThree.timeframe[i] = [1900, 2020]
            }
            if (!this.surveyData.questionThree.camera[i]) {
              this.surveyData.questionThree.camera[i] = ''
            }
            if (!this.surveyData.questionThree.gps[i]) {
              this.surveyData.questionThree.gps[i] = ''
            }
            if (!this.surveyData.questionThree.newInvest[i]) {
              this.surveyData.questionThree.newInvest[i] = ''
            }
            if (!this.surveyData.questionThree.comment[i]) {
              this.surveyData.questionThree.comment[i] = ''
            }
          })
        }
      }
    }
  },    
  data () {
    return {
      step: 1,
      pageNumber: 1,
      isHidden: false,
      errors: [],
      heatmap_coords: [],
      chosen_technique: null,
      min: 1900,
      max: 2020,
      currentColor: '',
      land_own: null,
      land_neighbor: null,
      landwirte: {landwirt_1: {name: "Landwirt 1", color: "#9B29F8"}, 
                  landwirt_2: {name: "Landwirt 2", color: "#EAB90C"},  
                  landwirt_3: {name: "Landwirt 3", color: "#06498B"}, 
                  landwirt_4: {name: "Landwirt 4", color: "#909085"},  
                  landwirt_5: {name: "Landwirt 5", color: "green"}
      },
      selectedLandwirt: null,
      surveyData: {
        _id: new Date().toISOString(),
        consent: null,
        questionOne: 'Ja',
        questionTwoAndSix: [], //here the farmer + neighbor coordinates are saved
        questionThree: {
          technique: [],
          timeframe: [],
          camera: [],
          gps: [],
          newInvest: [],
          comment: []
        },
        questionThreeAdditional: null,
        questionFour: 'Ja',
        questionFive: {
          landwirte: [], 
          vorauflauf: [],
          nachauflauf: []
        },
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
  created () {
    VueRangeSlider.methods.handleKeyup = () => console.log
    VueRangeSlider.methods.handleKeydown = () => console.log

    this.bgStyle = {
      backgroundColor: '#fff',
      boxShadow: 'inset 0.5px 0.5px 3px 1px rgba(0,0,0,.36)'
    }
    this.tooltipStyle = {
      backgroundColor: '#666',
      borderColor: '#666'
    }
    this.processStyle = {
      backgroundColor: '#999'
    }
    this.enableCross = false
    this.tooltipMerge = false
  },
  methods: {

    //-- Pouch DB methods

    /* 
    addFarmer: function(farmer_response){
          db.put(farmer_response, function callback(err) {
            if (!err) {
              console.log('Successfully posted a farmer feedback!');
            }})
          db.changes({
          since: 'now',
          live: true
          }).on('change', this.showResults());
          },  */ 

    setColor: function(index){
         if (this.step === 3) {
              this.currentColor = 'red'
              console.log(this.currentColor)
          }
          if (this.step === 7) {
              this.currentColor = this.surveyData.questionFive.landwirte[index].color}
              console.log(this.currentColor)
          },
          
    setGeolocation: function(location){
      for (var i = 0; i < location.length; i++) { 
          console.log("start" + i +location[i].color);
      }
      this.surveyData.questionTwoAndSix = location
      this.$refs.gmaps.setMode(false);
      },
    setMode: function(value){
              this.$refs.gmaps.setMode(value);
    },
    getGeolocation: function(){

      var heatmap_data = []

      db.allDocs({
          include_docs: true,
          descending: true
          }).then(function (result) {
            var jsonData = (result.rows)

            for (var i = 0; i < jsonData.length; i++) {
                var entries = jsonData[i].doc.questionTwoAndSix
                var techniques = jsonData[i].doc.questionThree.technique
                heatmap_data.push([{technique: techniques}])

                for (var j = 0; j < entries.length; j++) {
                    var geoloc = entries[j].position
                    var color = entries[j].color
                      if (color == "red") {
                        heatmap_data[i].push({geoloc})
                      }
                }
            }                 
          }).catch(function (err) {
          console.log("error" + err)
          })
          console.log(heatmap_data)
          this.heatmap_coords = heatmap_data
    },
    deleteDB: function(){
       db.allDocs().then(function (result) {
         return Promise.all( result.rows.map(function (row) {
            return db.remove(row.id, row.value.rev); 
            })); 
          }).then(function () {
            console.log("done");
        }).catch(function (err) {
          console.log("error" + err);
        });
    },
    deleteEntryTechnique: function (index) {
      this.surveyData.questionThree.technique.splice(index, 1)
      this.surveyData.questionThree.timeframe.splice(index, 1)
      this.surveyData.questionThree.camera.splice(index, 1)
      this.surveyData.questionThree.gps.splice(index, 1)
      this.surveyData.questionThree.newInvest.splice(index, 1)
      this.surveyData.questionThree.comment.splice(index, 1)
    },
    deleteEntryLandwirt: function (index) {
      this.surveyData.questionFive.landwirte.splice(index, 1)
      this.surveyData.questionFive.technique.splice(index, 1)
      this.surveyData.questionFive.vorauflauf.splice(index, 1)
      this.surveyData.questionFive.nachauflauf.splice(index, 1)
    },
    deleteRowTechnique () {
      // delete row (index-0).
      this.surveyData.questionThree.technique.splice(-1)
      this.surveyData.questionThree.timeframe.splice(-1)
      this.surveyData.questionThree.camera.splice(-1)
      this.surveyData.questionThree.gps.splice(-1)
      this.surveyData.questionThree.newInvest.splice(-1)
      this.surveyData.questionThree.comment.splice(-1)
    },
    deleteRowLandwirt () {
      // delete row (index-0).
      this.surveyData.questionFive.landwirte.splice(-1)
      this.surveyData.questionFive.technique.splice(-1)
      this.surveyData.questionFive.vorauflauf.splice(-1)
      this.surveyData.questionFive.nachauflauf.splice(-1)
    },
    prev () {
      this.step--
    },
    // those are question fields in the form, each of which is check if filled
    next (formFieldsToCheck) {
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
    
    async postData (url = '', data = {}) {
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

    /* showResults: function(){
          db.allDocs({
          include_docs: true,
          attachments: false, //no attachments are needed       
          descending: true
          }).then(function (result) {
          console.log("showing all docs:" + result);
          console.log("rows" + result.rows[0]);
          console.log("total rows " + result.total_rows);
          console.log("json" + result.json);
          }).catch(function (err) {
          console.log("error" + err);
          })}  */ 

    async submit () {
      try {

        // send data to the backend, for testing use: "https://httpbin.org/post"

        this.backendResponse = await db.put(this.surveyData,function callback(err) {
            if (!err) {
              console.log('Successfully posted a farmer feedback!');
            }})

        db.changes({
            since: 'now',
            live: true
            }) // .on('change', this.showDocs());

        console.log(this.backendResponse)
        this.step = 'done'
        this.showDocs()
        } 
      
        catch (e) {
        // ToDo: Handle errors
        console.error(e)
        this.step = 'error'
      }
    },
      async showDocs() {
      try {
        const {rows} = await db.allDocs({include_docs: true, descending: true})
        console.log(rows)
        //console.log("total rows " + rows.total_rows);
      } catch (e) {
        console.error(e)
      }
    }
      }
    }
</script>   
<style>

legend{
 font-size: 15px; 
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
  height: 40px;
  background: grey;
  border-radius: 50%;
}

.bubble-wrapper {
  padding: 15px 0px 15px 15px;
  width: fit-content;
  display: flex;
  flex-wrap: nowrap;
}

</style>
