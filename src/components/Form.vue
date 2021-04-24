<template>
  <div>
    <div class="container" v-show="showAll">
      <h2>To register, fill out the form. Thank you!</h2>
      <form @submit.prevent="checkForm">
        <div class="formGroup">
          <h3>Your data</h3>
          <div class="formInputContainer">
            <div>
              <p v-if="$v.formAll.name1.$dirty && !$v.formAll.name1.required">Required field</p>
              <p v-if="$v.formAll.name1.$dirty && !$v.formAll.name1.minLength">At least three characters</p>
              <input id="name1" class="formUserData" :class="$v.formAll.name1.$error ? 'isInvalid' : ''"
                     v-model.trim="formAll.name1">
              <div>
                <label for="name1">Name</label>
              </div>
            </div>
            <div>
              <input type="text" class="formUserData" id="patronymic" v-model.trim="formAll.patronymic">
              <div>
                <label for="patronymic">Patronymic</label>
              </div>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <p v-if="$v.formAll.surname.$dirty && !$v.formAll.surname.required">Required field</p>
              <input class="formUserData" :class="$v.formAll.surname.$error ? 'isInvalid' : ''" type="text" id="surname"
                     v-model.trim="formAll.surname">
              <div>
                <label for="surname">Surname</label>
              </div>
            </div>
            <div>
              <p v-if="$v.formAll.dataOfBirth.$dirty && !$v.formAll.dataOfBirth.required">Required field</p>
              <input class="formUserData" :class="$v.formAll.dataOfBirth.$error ? 'isInvalid' : ''" type="date"
                     id="dataOfBirth" v-model.trim="formAll.dataOfBirth">
              <div>
                <label for="dataOfBirth">DataOfBirth</label>
              </div>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <p v-if="$v.formAll.telephone.$dirty && !$v.formAll.telephone.required">Required field</p>
              <masked-input class="formUserData" :class="$v.formAll.telephone.$error ? 'isInvalid' : ''"
                            mask="\+\7 (111) 1111-11" placeholder="Phone" id="telephone"
                            v-model.trim="formAll.telephone"/>
              <div>
                <label for="telephone">Telephone</label>
              </div>
            </div>
            <div>
              <input class="formUserData" type="text" id="gender" v-model.trim="formAll.gender">
              <div>
                <label for="gender">Gender</label>
              </div>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <p v-if="$v.formAll.clientsAll.$dirty && !$v.formAll.clientsAll.required">Required field</p>
              <select class="formSelectMult" :class="$v.formAll.clientsAll.$error ? 'isInvalid' : ''" id="clients"
                      v-model="formAll.clientsAll" multiple>
                <option v-for="(client, index) in clients" :value="client.value" :key="index">
                  {{ client.label }}
                </option>
              </select>
              <div>
                <label for="clients">Clients</label>
              </div>
            </div>
            <div class="formCMCMbMt">
              <input type="checkbox" id="CMS" v-model="formAll.agreeWithSendEmail">
              <label for="CMS">Не отправлять СМС</label>
            </div>
            <div>
              <select id="doctors" v-model="formAll.doctor">
                <option v-for="(doctor, index) in doctors" :value="doctor.value" :key="index">
                  {{ doctor.label }}
                </option>
              </select>
              <div>
                <label for="doctors">Doctors</label>
              </div>
            </div>
          </div>
        </div>
        <div class="formGroup">
          <h3>Your address</h3>
          <div class="formInputContainer">
            <div>
              <input class="formUserData" type="text" id="index" v-model.trim="formAll.index">
              <div>
                <label for="index">Index</label>
              </div>
            </div>
            <div>
              <input class="formUserData" type="text" id="country" v-model.trim="formAll.country">
              <div>
                <label for="country">Country</label>
              </div>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <input class="formUserData" type="text" id="region" v-model.trim="formAll.region">
              <div>
                <label for="region">Region</label>
              </div>
            </div>
            <div>
              <p v-if="$v.formAll.city.$dirty && !$v.formAll.city.required">Required field</p>
              <input class="formUserData" :class="$v.formAll.city.$error ? 'isInvalid' : ''" type="text" id="city"
                     v-model.trim="formAll.city">
              <div>
                <label for="city">City</label>
              </div>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <input class="formUserData" type="text" id="street" v-model.trim="formAll.street">
              <div>
                <label for="street">Street</label>
              </div>
            </div>
            <div>
              <input class="formUserData" type="text" id="house" v-model.trim="formAll.house">
              <div>
                <label for="house">House</label>
              </div>
            </div>
          </div>
        </div>
        <div class="formGroup">
          <h3>Your document</h3>
          <div class="formInputContainer">
            <div>
              <label class="formLabelTittle" for="document">Identity document</label>
            </div>
            <div>
              <p v-if="$v.formAll.document1.$dirty && !$v.formAll.document1.required">Required field</p>
              <select class="formDocument" :class="$v.formAll.document1.$error ? 'isInvalid' : ''" id="document"
                      v-model="formAll.document1">
                <option v-for="(document, index) in documents" :value="document.value" :key="index">
                  {{ document.label }}
                </option>
              </select>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <input class="formUserData" type="text" id="series" v-model.trim="formAll.series">
              <div>
                <label for="series">series</label>
              </div>
            </div>
            <div>
              <input class="formUserData" type="text" id="number" v-model.trim="formAll.number">
              <div>
                <label for="number">number</label>
              </div>
            </div>
          </div>
          <div class="formInputContainer">
            <div>
              <input class="formUserData" type="text" id="issuedBy" v-model.trim="formAll.issuedBy">
              <div>
                <label for="issuedBy">Issued by</label>
              </div>
            </div>
            <div>
              <p v-if="$v.formAll.dateOfIssue.$dirty && !$v.formAll.dateOfIssue.required">Required field</p>
              <input class="formUserData" :class="$v.formAll.dateOfIssue.$error ? 'isInvalid' : ''" type="date"
                     id="dateOfIssue" v-model.trim="formAll.dateOfIssue">
              <div>
                <label for="dateOfIssue">Date of issue</label>
              </div>
            </div>
          </div>
        </div>
        <div>
        </div>
        <p v-show="show1">Good</p>
        <Button :text="text" @addAlert="addAlert"/>
      </form>
    </div>
    <transition name="fade">
      <div class="formCheckInContainer" v-show="showCheckIn">
        <div class="formCheckIn">
          <h1>Registration completed</h1>
          <div class="buttonContainer">
            <ButtonMini :text="textButtonMiniBack" @comeBack="comeBack"/>
            <ButtonMini :text="textButtonMiniSomething"/>
          </div>
        </div>
        <img src="../assets/Fon.png">
      </div>
    </transition>
  </div>
</template>

<script>
import Button from './Button'
import MaskedInput from 'vue-masked-input'
import { validationMixin } from 'vuelidate'
import { required, minLength } from 'vuelidate/lib/validators'
import ButtonMini from './ButtonMini'
export default {
  mixins: [validationMixin],
  data () {
    return {
      vvv: false,
      showAll: true,
      showCheckIn: false,
      text: 'Submit',
      textButtonMiniBack: 'come back',
      textButtonMiniSomething: 'do something',
      formAll: {
        name1: '',
      patronymic: '',
      surname: '',
      dataOfBirth: '',
      telephone: '',
      gender: '',
      client1: 'vip',
      clientsAll: [],
      doctor: 'ivanov',
      agreeWithSendEmail: true,
        index: '',
        country: '',
        region: '',
        city: '',
        street: '',
        house: '',
        document1: '',
        series: '',
        number: '',
        issuedBy: '',
        dateOfIssue: ''
      },
      clients: [
        {
          label: 'VIP',
          value: 'vip'
        },
          {
          label: 'Проблемные',
          value: 'problems'
        },
           {
          label: 'ОМС',
          value: 'oms'
        }
      ],
      doctors: [
        {
          label: 'Иванов',
          value: 'ivanov'
        },
          {
          label: 'Захаров',
          value: 'zasharov'
        },
          {
          label: 'Чернышова',
          value: 'cherneshova'
        }
      ],
        documents: [
        {
          label: 'Паспорт',
          value: 'passport'
        },
          {
          label: 'Свидетельство о рождении',
          value: 'birthСertificate'
        },
          {
          label: 'Водительское удостоверение',
          value: 'driver\'sLicense'
        }
      ],
      show1: false,
      phone: 'qqq'
    }
  },
  components: {
  MaskedInput,
    Button,
    ButtonMini
},
   validations: {
      formAll: {
        name1: {
          required, minLength: minLength(3)
        },
        surname: {required},
        dataOfBirth: {required},
        telephone: {required},
        city: {required},
        dateOfIssue: {required},
        document1: {required},
        clientsAll: {required},
      }
    },
  methods: {
    addAlert () {
      this.showAll = !this.showAll
      this.showCheckIn = !this.showCheckIn
    },
    checkForm() {
      this.$v.formAll.$touch()
      if (!this.$v.formAll.$error) {
        this.showCheckIn = true
        this.showAll = false
      } else {
        this.showCheckIn= false
        this.showAll = true
      }
    },
    comeBack () {
      this.showAll = !this.showAll
      this.showCheckIn = !this.showCheckIn
    }
  }
}
</script>

<style lang="sass">
@import '../Style/StyleAll'
@import '../Style/Variables'
img
  width: 100%
  height: 100%
.container
  width: 800px
  margin: 0 auto
  padding: 30px
  h2
    margin-bottom: 30px
  @media (max-width: 900px)
    width: 100%
    padding: 3%

.formGroup
  border: cornflowerblue 1px solid
  background: $formBackground
  border-radius: 15px
  width: 100%
  margin-bottom: 15px
  padding: 20px 40px 0 40px
  box-shadow: 3px 3px 5px gainsboro
  @media (max-width: 430px)
    padding: 15px 5px 0 5px
  h3
    margin-bottom: 20px

.formInputContainer
  width: 100%
  margin-bottom: 20px
  display: flex
  justify-content: space-between
  @media (max-width: 760px)
    display: inline-block
    text-align: center
  p
    font-size: 12px
    font-family: InglobalI Arial

.formUserData, .formDocument
  width: 300px
  height: 20px
  border: gainsboro 1px solid
  border-radius: 5px
  padding: 0
  padding-left: 5px
  @media (max-width: 430px)
    width: 280px

.formSelectMult
  width: 100px
  height: 50px
  font-size: 12px

.formDocument
  width: 305px
  background: white
  @media (max-width: 350px)
    width: 280px

.formLabelTittle
  width: 300px

.isInvalid
  background: $formError
  opacity: .5

.formCMCMbMt
  @media (max-width: 760px)
    margin-bottom: 15px
    margin-top: 15px

.formCheckInContainer
  position: relative

.fade-enter-active, .fade-leave-active
  transition: opacity 2.5s

.fade-enter, .fade-leave-to
  opacity: 0

.buttonContainer
  display: flex
  justify-content: space-between


.formCheckIn
  position: absolute
  width: 320px
  left: 40%
  top: 30%
  h1
    color: $formText
    @media (max-width: 900px)
      font-size: 25px
    @media (max-width: 420px)
      font-size: 20px
      left: 30%

  @media (max-width: 900px)
    width: 250px
  @media (max-width: 650px)
    left: 30%
  @media (max-width: 420px)
    width: 200px




</style>
